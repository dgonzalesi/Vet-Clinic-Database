/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name character VARCHAR(50) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status  VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(id),
  FOREIGN KEY (id) REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(50),
  name VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE invoices (
	id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(10,2),
    quantity INT,
    total_price DECIMAL(10,2),
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories_treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  PRIMARY KEY (id)
);
