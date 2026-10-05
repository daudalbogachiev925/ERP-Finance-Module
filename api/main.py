from fastapi import FastAPI
import psycopg2
app = FastAPI()

@app.get("/balance")
def balance():
    conn = psycopg2.connect("dbname=erp user=admin password=admin host=db")
    cur = conn.cursor()
    cur.execute(open("reports/balance_sheet.sql").read())
    return {"rows": cur.fetchall()}
