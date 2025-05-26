-- Seed data for contacts table
INSERT INTO public.contacts (id, name, email, phone) VALUES
(1, 'John Doe', 'john.doe@example.com', '555-0123'),
(2, 'Jane Smith', 'jane.smith@example.com', '555-0456'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '555-0789');

-- Seed data for properties table
INSERT INTO public.properties (id, address, geom) VALUES
(1, '123 Main St, Springfield', ST_GeomFromText('POLYGON((-89.5 39.8, -89.5 39.9, -89.4 39.9, -89.4 39.8, -89.5 39.8))', 4326)),
(2, '456 Oak Ave, Springfield', ST_GeomFromText('POLYGON((-89.6 39.7, -89.6 39.8, -89.5 39.8, -89.5 39.7, -89.6 39.7))', 4326)),
(3, '789 Pine Rd, Springfield', ST_GeomFromText('POLYGON((-89.7 39.6, -89.7 39.7, -89.6 39.7, -89.6 39.6, -89.7 39.6))', 4326));

-- Seed data for paperwork table
INSERT INTO public.paperwork (id, title, file_url) VALUES
(1, 'Deed for 123 Main St', 'http://example.com/deed_123_main.pdf'),
(2, 'Title Insurance for 456 Oak Ave', 'http://example.com/title_456_oak.pdf'),
(3, 'Survey for 789 Pine Rd', 'http://example.com/survey_789_pine.pdf'),
(4, 'Contract for Sale', 'http://example.com/contract_sale.pdf');

-- Seed data for contact_paperwork table
INSERT INTO public.contact_paperwork ("createdAt", "updatedAt", contact_id, paperwork_id) VALUES
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 1, 1),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 2, 2),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 3, 3),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 1, 4);

-- Seed data for contact_property table
INSERT INTO public.contact_property ("createdAt", "updatedAt", contact_id, property_id) VALUES
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 1, 1),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 2, 2),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 3, 3),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 1, 2);

-- Seed data for property_paperwork table
INSERT INTO public.property_paperwork ("createdAt", "updatedAt", property_id, paperwork_id) VALUES
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 1, 1),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 2, 2),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 3, 3),
('2025-05-26 10:00:00+00', '2025-05-26 10:00:00+00', 1, 4);