import psycopg2

conn = psycopg2.connect("dbname='serverdata' user='seeker'")
cur = conn.cursor()
cur.execute("""SELECT *  from servers""")
rows = cur.fetchall()
for row in rows:
    print (row)

