-- Wildlife Conservation Tracking System 

-- Species
INSERT INTO Species VALUES (1, 'Mountain Gorilla', 'Mammal', 'Endangered');
INSERT INTO Species VALUES (2, 'Grey Crowned Crane', 'Bird', 'Vulnerable');
INSERT INTO Species VALUES (3, 'African Buffalo', 'Mammal', 'Least Concern');
INSERT INTO Species VALUES (4, 'Serval', 'Mammal', 'Least Concern');
INSERT INTO Species VALUES (5, 'White Rhinoceros', 'Mammal', 'Near Threatened');
INSERT INTO Species VALUES (6, 'Papyrus Gonolek', 'Bird', 'Near Threatened');
INSERT INTO Species VALUES (7, 'Leopard', 'Mammal', 'Vulnerable');
INSERT INTO Species VALUES (8, 'African Fish Eagle', 'Bird', 'Least Concern');
INSERT INTO Species VALUES (9, 'Golden Monkey', 'Mammal', 'Endangered');
INSERT INTO Species VALUES (10, 'African Elephant', 'Mammal', 'Endangered');

-- Habitat
INSERT INTO Habitat VALUES (1, 'Volcanoes National Park', 'Northern Province', 1600);
INSERT INTO Habitat VALUES (2, 'Akagera National Park', 'Eastern Province', 2500);
INSERT INTO Habitat VALUES (3, 'Nyungwe Forest', 'Western Province', 2100);
INSERT INTO Habitat VALUES (4, 'Gishwati-Mukura Park', 'North-Western Province', 900);
INSERT INTO Habitat VALUES (5, 'Rugezi Marsh', 'Northern Province', 600);
INSERT INTO Habitat VALUES (6, 'Bugesera Wetlands', 'Eastern Province', 700);
INSERT INTO Habitat VALUES (7, 'Lake Kivu Shoreline', 'Western Province', 1800);
INSERT INTO Habitat VALUES (8, 'Bugarama Valley', 'Southern Province', 1200);
INSERT INTO Habitat VALUES (9, 'Kibira Forest Extension', 'South-West Border', 1900);
INSERT INTO Habitat VALUES (10, 'Kigali Outskirts Reserve', 'Central Province', 1300);

-- Animal
INSERT INTO Animal VALUES (1, 'Imbuto', 'Female', 1, 1, 'Healthy', TO_DATE('2013-08-12', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (2, 'Karabo', 'Male', 2, 2, 'Injured', TO_DATE('2018-02-25', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (3, 'Inkuba', 'Male', 3, 2, 'Healthy', TO_DATE('2015-11-06', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (4, 'Tamu', 'Female', 4, 3, 'Sick', TO_DATE('2014-05-20', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (5, 'Rukuru', 'Male', 5, 4, 'Critical', TO_DATE('2011-09-13', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (6, 'Zuba', 'Female', 6, 5, 'Healthy', TO_DATE('2017-06-15', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (7, 'Bahari', 'Male', 7, 6, 'Injured', TO_DATE('2016-03-09', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (8, 'Akira', 'Female', 8, 7, 'Healthy', TO_DATE('2012-12-29', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (9, 'Gakuru', 'Male', 9, 8, 'Sick', TO_DATE('2010-07-07', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (10, 'Shujaa', 'Male', 10, 9, 'Healthy', TO_DATE('2009-04-18', 'YYYY-MM-DD'));

-- Ranger
INSERT INTO Ranger VALUES (1, 'Eric Ndayisaba', 'eric.ndayisaba@wildlife.rw', '0788001122', 'Volcanoes National Park');
INSERT INTO Ranger VALUES (2, 'Aline Uwimana', 'aline.uwimana@wildlife.rw', '0788002233', 'Akagera National Park');
INSERT INTO Ranger VALUES (3, 'Samuel Hakizimana', 'samuel.h@wildlife.rw', '0788003344', 'Nyungwe Forest');
INSERT INTO Ranger VALUES (4, 'Claudine Mukamana', 'claudine.m@wildlife.rw', '0788004455', 'Gishwati-Mukura Park');
INSERT INTO Ranger VALUES (5, 'Patrick Habimana', 'patrick.h@wildlife.rw', '0788005566', 'Rugezi Marsh');
INSERT INTO Ranger VALUES (6, 'Josiane Uwase', 'josiane.u@wildlife.rw', '0788006677', 'Bugesera Wetlands');
INSERT INTO Ranger VALUES (7, 'Jean Bosco', 'jean.b@wildlife.rw', '0788007788', 'Lake Kivu Shoreline');
INSERT INTO Ranger VALUES (8, 'Mutesi Angelique', 'mutesi.a@wildlife.rw', '0788008899', 'Bugarama Valley');
INSERT INTO Ranger VALUES (9, 'Felicien Gatera', 'felicien.g@wildlife.rw', '0788009900', 'Kibira Forest Extension');
INSERT INTO Ranger VALUES (10, 'Christine Nyirahabimana', 'christine.n@wildlife.rw', '0788010011', 'Kigali Outskirts Reserve');

-- Incident
INSERT INTO Incident VALUES (1, 2, 2, 'Snaring', TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'Crane injured in trap near marsh area.');
INSERT INTO Incident VALUES (2, 5, 4, 'Poaching', TO_DATE('2025-03-03', 'YYYY-MM-DD'), 'White Rhino wounded by suspected poachers.');
INSERT INTO Incident VALUES (3, 4, 3, 'Illness', TO_DATE('2025-02-12', 'YYYY-MM-DD'), 'Serval displaying signs of respiratory infection.');
INSERT INTO Incident VALUES (4, 7, 6, 'Injury', TO_DATE('2025-01-29', 'YYYY-MM-DD'), 'Leopard injured while hunting.');
INSERT INTO Incident VALUES (5, 9, 8, 'Disease Outbreak', TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Golden Monkeys showing flu-like symptoms.');
INSERT INTO Incident VALUES (6, 6, 5, 'Trap Injury', TO_DATE('2025-03-15', 'YYYY-MM-DD'), 'Gonolek found with leg trapped.');
INSERT INTO Incident VALUES (7, 8, 7, 'Water Contamination', TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'Fish Eagle affected by lake pollution.');
INSERT INTO Incident VALUES (8, 10, 9, 'Human Conflict', TO_DATE('2025-04-18', 'YYYY-MM-DD'), 'Elephant damaged farm property and got injured.');
INSERT INTO Incident VALUES (9, 3, 1, 'Fight Injury', TO_DATE('2025-03-25', 'YYYY-MM-DD'), 'Buffalo wounded in territorial clash.');
INSERT INTO Incident VALUES (10, 1, 1, 'Health Check', TO_DATE('2025-04-20', 'YYYY-MM-DD'), 'Routine check showed mild dehydration.');

-- Medical_Treatment
INSERT INTO Medical_Treatment VALUES (11, 2, 'Wing Treatment', TO_DATE('2025-04-11', 'YYYY-MM-DD'), 'Recovering');
INSERT INTO Medical_Treatment VALUES (12, 5, 'Bullet Wound Care', TO_DATE('2025-03-04', 'YYYY-MM-DD'), 'Stable condition');
INSERT INTO Medical_Treatment VALUES (13, 4, 'Antibiotics', TO_DATE('2025-02-13', 'YYYY-MM-DD'), 'Improving');
INSERT INTO Medical_Treatment VALUES (14, 7, 'Wound Stitching', TO_DATE('2025-01-30', 'YYYY-MM-DD'), 'Recovering');
INSERT INTO Medical_Treatment VALUES (15, 9, 'Quarantine & Flu Treatment', TO_DATE('2025-04-02', 'YYYY-MM-DD'), 'Ongoing observation');
INSERT INTO Medical_Treatment VALUES (16, 6, 'Leg Care & Monitoring', TO_DATE('2025-03-16', 'YYYY-MM-DD'), 'Responding well');
INSERT INTO Medical_Treatment VALUES (17, 8, 'Detox Therapy', TO_DATE('2025-02-06', 'YYYY-MM-DD'), 'Stable');
INSERT INTO Medical_Treatment VALUES (18, 10, 'Leg Wrap & Pain Relief', TO_DATE('2025-04-19', 'YYYY-MM-DD'), 'Improving');
INSERT INTO Medical_Treatment VALUES (19, 3, 'Antiseptic Application', TO_DATE('2025-03-26', 'YYYY-MM-DD'), 'Healed');
INSERT INTO Medical_Treatment VALUES (20, 1, 'Fluid Rehydration', TO_DATE('2025-04-21', 'YYYY-MM-DD'), 'Recovered');

-- Researcher
INSERT INTO Researcher VALUES (11, 'Dr. Jeanette Umwali', 'Rwanda Wildlife Institute', 'Ornithology');
INSERT INTO Researcher VALUES (12, 'Prof. Patrick Mugisha', 'Kigali University of Conservation', 'Large Mammals');
INSERT INTO Researcher VALUES (13, 'Dr. Emmanuel Nsengimana', 'Akagera Wildlife Lab', 'Wetland Ecology');
INSERT INTO Researcher VALUES (14, 'Dr. Grace Ingabire', 'Gorilla Trust Rwanda', 'Primatology');
INSERT INTO Researcher VALUES (15, 'John Rukundo', 'Conservation NGO', 'Forest Biodiversity');
INSERT INTO Researcher VALUES (16, 'Martha Uwamahoro', 'Nyungwe Research Center', 'Medicinal Plants & Wildlife');
INSERT INTO Researcher VALUES (17, 'Alain Mutabazi', 'Lake Kivu Research Org', 'Avian Ecology');
INSERT INTO Researcher VALUES (18, 'Dr. Ange Tuyisenge', 'Rwanda Eco Alliance', 'Animal Nutrition');
INSERT INTO Researcher VALUES (19, 'Solange Kamikazi', 'Youth for Nature Rwanda', 'Community Conservation');
INSERT INTO Researcher VALUES (20, 'Eric Gasana', 'Global Wildlife Watch', 'Elephant Behavior');

-- Public_Holidays
INSERT INTO Public_Holidays VALUES (11, 'Kwibohora (Liberation Day)', TO_DATE('2025-07-04', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (12, 'Umuganura (Harvest Day)', TO_DATE('2025-08-02', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (13, 'Genocide Memorial Day', TO_DATE('2025-04-07', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (14, 'Labour Day', TO_DATE('2025-05-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (15, 'Christmas Day', TO_DATE('2025-12-25', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (16, 'New Year''s Day', TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (17, 'Heroes Day', TO_DATE('2025-02-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (18, 'Independence Day', TO_DATE('2025-07-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (19, 'Eid al-Fitr', TO_DATE('2025-03-31', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (20, 'Eid al-Adha', TO_DATE('2025-06-06', 'YYYY-MM-DD'));
