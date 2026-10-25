-- TechNova sample data (generated from the frontend catalogue)
PRAGMA foreign_keys = ON;

INSERT INTO categories (slug,name,emoji) VALUES
  ('smartphones','Smartphones','📱'),
  ('laptops','Laptops','💻'),
  ('audio','Audio','🎧'),
  ('cameras','Cameras','📷'),
  ('wearables','Wearables','⌚'),
  ('smarthome','Smart Home','🏠');

INSERT INTO brands (slug,name) VALUES
  ('samsung','Samsung'),
  ('apple','Apple'),
  ('dell','Dell'),
  ('sony','Sony'),
  ('bose','Bose'),
  ('canon','Canon');

INSERT INTO products (product_id,name,category_id,brand_id,price,stock,rating,review_count,emoji,tag,tag_class,short_desc,full_desc,specs_json) VALUES
  (1,'ProPhone X15',1,1,999,42,4.9,2341,'📱','Best Seller','','6.7" AMOLED · 200MP Camera · 5000mAh','The ProPhone X15 redefines what a smartphone can do. With its stunning 6.7" AMOLED display, industry-leading 200MP camera system, and a massive 5000mAh battery, it is built for those who demand the very best.','{"Display":"6.7\" AMOLED 120Hz","Camera":"200MP + 12MP + 10MP","Battery":"5000mAh","Processor":"Snapdragon 8 Gen 4","Storage":"256GB / 512GB","RAM":"12GB / 16GB"}'),
  (2,'iPhone 16 Pro',1,2,1199,18,4.9,5821,'📱','New','','6.1" Super Retina · A18 chip · 48MP','The iPhone 16 Pro is the most powerful iPhone ever. Featuring the all-new A18 chip, a Pro camera system with 48MP, and a beautiful Super Retina XDR display.','{"Display":"6.1\" Super Retina XDR","Camera":"48MP Main + 12MP Ultra Wide","Battery":"3274mAh","Processor":"A18 chip","Storage":"128GB – 1TB","RAM":"8GB"}'),
  (3,'Galaxy S25 Ultra',1,1,1299,25,4.8,3201,'📱','Hot','hot-tag','6.8" Dynamic AMOLED · 200MP · S Pen','The Galaxy S25 Ultra pairs a massive 6.8" Dynamic AMOLED 2X display with a 200MP camera system and the built-in S Pen, for a phone that doubles as a creative studio.','{"Display":"6.8\" Dynamic AMOLED 2X","Camera":"200MP + 50MP + 12MP + 10MP","Battery":"5000mAh","Processor":"Snapdragon 8 Elite","Storage":"256GB / 512GB / 1TB","RAM":"12GB"}'),
  (4,'UltraBook Pro 16',2,3,1499,12,4.8,1892,'💻','New','','Intel i9 · 32GB RAM · 1TB SSD','The UltraBook Pro 16 is a powerhouse laptop designed for creators and professionals. Featuring the latest Intel Core i9 processor, 32GB RAM, and a stunning 4K OLED display.','{"Display":"16\" 4K OLED 120Hz","Processor":"Intel Core i9-14900H","RAM":"32GB DDR5","Storage":"1TB NVMe SSD","Battery":"86Wh","Weight":"1.8kg"}'),
  (5,'MacBook Air M3',2,2,1299,30,4.9,6102,'💻','Best Seller','','M3 chip · 15" display · 18hr battery','The MacBook Air M3 is thinner, faster and quieter than ever. With up to 18 hours of battery life and a stunning 15" Liquid Retina display, it is built to keep up with you all day.','{"Display":"15.3\" Liquid Retina","Processor":"Apple M3 8-core CPU","RAM":"8GB / 16GB","Storage":"256GB – 1TB SSD","Battery":"Up to 18 hours","Weight":"1.51kg"}'),
  (6,'Dell XPS 15',2,3,1799,3,4.7,982,'💻','Sale','sale-tag','Intel i7 · 16GB RAM · OLED display','The Dell XPS 15 combines a stunning 3.5K OLED display with serious performance, in a compact aluminium chassis built for professionals on the move.','{"Display":"15.6\" 3.5K OLED","Processor":"Intel Core i7-13700H","RAM":"16GB DDR5","Storage":"512GB SSD","Battery":"86Wh","Weight":"1.84kg"}'),
  (7,'SoundMax Pro ANC',3,4,249,60,4.7,3102,'🎧','Sale','sale-tag','Active Noise Cancelling · 40hr Battery','Experience audio perfection with the SoundMax Pro ANC. Industry-leading active noise cancellation combined with rich, detailed sound and an incredible 40-hour battery life.','{"Type":"Over-ear","Noise Cancelling":"Active (ANC)","Battery":"40 hours","Connectivity":"Bluetooth 5.3","Driver":"40mm","Weight":"250g"}'),
  (8,'Bose QC45',3,5,329,22,4.8,2841,'🎧','Popular','','Premium ANC · 24hr battery · Multipoint','The Bose QC45 delivers Bose''s signature noise cancellation and balanced sound, with all-day comfort and seamless multipoint Bluetooth pairing.','{"Type":"Over-ear","Noise Cancelling":"Active (ANC)","Battery":"24 hours","Connectivity":"Bluetooth 5.1, Multipoint","Driver":"40mm TriPort","Weight":"238g"}'),
  (9,'Sony WH-1000XM6',3,4,399,15,4.9,4210,'🎧','New','','Industry-leading ANC · Hi-Res Audio','The WH-1000XM6 sets the benchmark for noise cancellation, with adaptive ANC, Hi-Res Audio support, and up to 30 hours of battery life.','{"Type":"Over-ear","Noise Cancelling":"Adaptive ANC","Battery":"30 hours","Connectivity":"Bluetooth 5.3","Driver":"30mm","Weight":"254g"}'),
  (10,'Alpha A7 IV',4,4,2499,6,4.9,1204,'📷','Pro','','33MP Full-Frame · 4K 60fps · Dual SD','The Alpha A7 IV is a true hybrid powerhouse, pairing a 33MP full-frame sensor with 4K 60fps video and professional-grade dual card slots.','{"Sensor":"33MP Full-Frame CMOS","Video":"4K 60fps","Storage":"Dual SD (UHS-II)","ISO":"100–51,200","Autofocus":"759-point Hybrid AF","Weight":"658g"}'),
  (11,'Canon EOS R8',4,6,1499,0,4.7,892,'📷','New','','24.2MP · Full-Frame · Eye Tracking AF','The Canon EOS R8 packs full-frame image quality and Canon''s advanced Eye Tracking autofocus into a lightweight, travel-friendly body.','{"Sensor":"24.2MP Full-Frame CMOS","Video":"4K 60fps","Autofocus":"Eye / Face Tracking AF","ISO":"100–102,400","Storage":"1x SD (UHS-II)","Weight":"461g"}'),
  (12,'SmartWatch Ultra 2',5,2,399,34,4.9,4210,'⌚','Hot','hot-tag','Health Tracking · GPS · Always-On Display','The SmartWatch Ultra 2 is your ultimate health companion. Track your heart rate, blood oxygen, sleep patterns, and workouts with unmatched precision.','{"Display":"1.9\" Always-On AMOLED","Battery":"Up to 60 hours","GPS":"Built-in Multi-band","Health Sensors":"Heart rate, SpO2, ECG","Water Resistance":"100m","Weight":"49g"}'),
  (13,'Galaxy Watch 7',5,1,299,4,4.7,2103,'⌚','New','','Advanced health sensors · 4G LTE','The Galaxy Watch 7 brings advanced health sensors and full 4G LTE connectivity to your wrist, so you can stay connected even without your phone.','{"Display":"1.5\" Super AMOLED","Battery":"Up to 40 hours","Connectivity":"4G LTE + Bluetooth","Health Sensors":"BioActive Sensor","Water Resistance":"5ATM + IP68","Weight":"34g"}'),
  (14,'Smart Hub 360',6,1,149,50,4.6,1823,'🏠','Popular','','Controls 100+ devices · Voice assistant','The Smart Hub 360 is the brain of your smart home, connecting and controlling over 100 compatible devices from a single app or voice command.','{"Compatibility":"100+ smart devices","Voice Assistant":"Built-in","Connectivity":"Wi-Fi + Zigbee + Bluetooth","Power":"USB-C","App Control":"iOS & Android","Setup":"5-minute guided setup"}'),
  (15,'Smart LED Strip 5m',6,4,49,80,4.5,5201,'💡','Sale','sale-tag','16M colors · App control · Music sync','Transform any room with the Smart LED Strip 5m — 16 million colours, app and voice control, and built-in microphone sync that dances with your music.','{"Length":"5 metres","Colors":"16 million (RGB)","Control":"App + Voice Assistant","Music Sync":"Built-in mic sync","Power":"USB powered","Cuttable":"Yes, every 3 LEDs"}');

-- Orders (users are inserted by init-db.js because passwords must be hashed first)
INSERT INTO orders (order_id,user_id,status,total_amount,created_at) VALUES
  (1,2,'delivered',1297,'2026-08-12 10:15:00'),
  (2,3,'shipped',  1299,'2026-09-03 14:40:00'),
  (3,2,'paid',      448,'2026-09-20 09:05:00'),
  (4,4,'pending',   299,'2026-10-02 16:30:00');

INSERT INTO order_items (order_id,product_id,quantity,unit_price) VALUES
  (1,1,1, 999),
  (1,15,1, 49),
  (1,7,1, 249),
  (2,5,1,1299),
  (3,12,1, 399),
  (3,15,1, 49),
  (4,13,1, 299);

INSERT INTO contact_messages (name,email,subject,message) VALUES
  ('Mia Thompson','mia@example.com','Order enquiry','Hi, when will my Galaxy Watch 7 order be dispatched?'),
  ('Liam Chen','liam@example.com','Product question','Does the Alpha A7 IV come with a lens?');
