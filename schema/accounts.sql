CREATE TABLE accounts (
    code TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT CHECK (type IN ('A','P','AP')),
    parent_code TEXT REFERENCES accounts(code)
);

CREATE TABLE periods (
    id SERIAL PRIMARY KEY,
    year INT, month INT,
    status TEXT DEFAULT 'open',
    UNIQUE(year, month)
);

CREATE TABLE documents (
    id BIGSERIAL PRIMARY KEY,
    doc_type TEXT, doc_date DATE,
    amount NUMERIC(15,2), period_id INT REFERENCES periods(id)
);

CREATE TABLE postings (
    id BIGSERIAL PRIMARY KEY,
    document_id BIGINT REFERENCES documents(id),
    debit_account TEXT REFERENCES accounts(code),
    credit_account TEXT REFERENCES accounts(code),
    amount NUMERIC(15,2),
    posted_at TIMESTAMP DEFAULT NOW()
);
