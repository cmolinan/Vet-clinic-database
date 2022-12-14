CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    PRIMARY KEY (id)
);
CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type varchar,
    name varchar,
    PRIMARY KEY (id)
);
CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status varchar,
    FOREIGN KEY (patient_id) REFERENCES  patients(id),
    FOREIGN KEY (id) REFERENCES treatments(id),
    PRIMARY KEY (id)
);
CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES  medical_histories(id),
    PRIMARY KEY (id)
);
CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES  invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES  treatments(id),
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories_treatments (
    id INT GENERATED ALWAYS AS IDENTITY,    
    medical_history_id INT,
    treatments_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES  medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES  treatments(id),
    PRIMARY KEY (id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX on invoice_items(invoice_id);
CREATE index ON invoice_items(treatment_id);
CREATE INDEX ON medical_histories_treatments(medical_history_id);
CREATE INDEX ON medical_histories_treatments(treatment_id);

