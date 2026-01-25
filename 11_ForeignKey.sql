DROP TABLE IF EXISTS address;

CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        -- use ON DELETE RESTRICT to prevent deleting parent if child exists
);

-- ON DELETE CASCADE  → deleting a user deletes related address rows
-- ON DELETE RESTRICT → deleting a user is blocked if address exists
-- ON DELETE SET NULL
-- If a user is deleted, user_id in address becomes NULL
-- Address row is preserved, parent reference is removed

INSERT INTO address (user_id, street, city, state, pincode) VALUES
(1,  '12 MG Road',        'Bengaluru',   'Karnataka',      '560001'),
(2,  '45 Park Street',   'Kolkata',     'West Bengal',    '700016'),
(3,  '101 FC Road',      'Pune',        'Maharashtra',    '411004'),
(5,  '9 Banjara Hills',  'Hyderabad',   'Telangana',      '500034'),
(7,  '14 Connaught Pl',  'New Delhi',   'Delhi',          '110001'),
(8,  '56 Law Garden',    'Ahmedabad',   'Gujarat',        '380009'),
(9,  '88 Marine Drive',  'Mumbai',      'Maharashtra',    '400020'),
(10, '31 Alkapuri',      'Vadodara',    'Gujarat',        '390007'),
(14, '120 Kankarbagh',   'Patna',       'Bihar',          '800020'),
(15, '42 Gomti Nagar',   'Lucknow',     'Uttar Pradesh',  '226010'),
(16, '18 RS Puram',      'Coimbatore',  'Tamil Nadu',     '641002'),
(17, '73 MG Road',       'Indore',      'Madhya Pradesh', '452001'),
(18, '200 Hitech City',  'Hyderabad',   'Telangana',      '500081'),
(19, '11 Vastrapur',     'Ahmedabad',   'Gujarat',        '380015'),
(20, '99 Whitefield',    'Bengaluru',   'Karnataka',      '560066'),
(21, '5 Civil Lines',    'Jaipur',      'Rajasthan',     '302006'),
(23, '66 Gariahat Rd',   'Kolkata',     'West Bengal',    '700029'),
(25, '77 Sector 18',     'Noida',       'Uttar Pradesh',  '201301');

SELECT * FROM users;
