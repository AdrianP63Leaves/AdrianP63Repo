     import React, { useEffect, useState } from 'react';
     import { MapContainer, TileLayer, Polygon, Popup } from 'react-leaflet';
     import axios from 'axios';
     import 'leaflet/dist/leaflet.css';

     const MapView = () => {
       const [properties, setProperties] = useState([]);
       const mapCenter = [51.505, -0.09];
       const zoomLevel = 13;

       useEffect(() => {
         axios
           .get(`${process.env.REACT_APP_API_URL}/properties`)
           .then((response) => {
             setProperties(response.data);
           })
           .catch((error) => {
             console.error('Error fetching properties:', error);
           });
       }, []);

       return (
         <MapContainer
           center={mapCenter}
           zoom={zoomLevel}
           style={{ height: '600px', width: '100%' }}
         >
           <TileLayer
             url={`https://www.google.com/maps/vt?lyrs=s&x={x}&y={y}&z={z}&key=${process.env.REACT_APP_GOOGLE_MAPS_API_KEY}`}
             attribution='&copy; <a href="https://www.google.com/maps">Google Maps</a>'
           />
           {properties.map((prop) => (
             <Polygon
               key={prop.id}
               positions={
                 prop.geom.coordinates[0].map((coord) => [coord[1], coord[0]])
               }
               pathOptions={{ color: 'blue', fillOpacity: 0.4 }}
             >
               <Popup>
                 <div>
                   <h3>{prop.address}</h3>
                   <p>ID: {prop.id}</p>
                 </div>
               </Popup>
             </Polygon>
           ))}
         </MapContainer>
       );
     };

     export default MapView;