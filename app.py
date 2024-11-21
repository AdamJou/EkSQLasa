from flask import Flask, render_template, request, flash
import psycopg2
import os

app = Flask(__name__)
app.secret_key = "supersecretkey"

def get_db_connection():
    conn = psycopg2.connect(os.getenv('DATABASE_URL'))
    return conn

@app.route('/')
def league_tables():
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT id, name FROM seasons ORDER BY year_start DESC")
    seasons = cursor.fetchall()

    season_data = {}
    for season_id, season_name in seasons:
        cursor.execute(f"""
        SELECT 
            ROW_NUMBER() OVER (ORDER BY sts.points DESC, sts.goal_difference DESC) AS position,
            t.name AS team,
            sts.matches_played AS matches,
            sts.wins AS wins,
            sts.draws AS draws,
            sts.losses AS losses,
            CONCAT(sts.goals_for, ':', sts.goals_against) AS goals,
            sts.goal_difference AS goal_difference,
            sts.points AS points
        FROM 
            season_team_stats sts
        JOIN 
            teams t ON sts.team_id = t.id
        WHERE 
            sts.season_id = {season_id}
        ORDER BY 
            position ASC
        """)
        season_data[season_name] = cursor.fetchall()

    conn.close()
    return render_template('league_tables.html', season_data=season_data)

@app.route('/query', methods=['GET', 'POST'])
def execute_query():
    result = None
    query = ""
    if request.method == 'POST':
        query = request.form.get('sql_query')
        if query:
            try:
                if not query.strip().lower().startswith('select'):
                    flash("Dozwolone są tylko zapytania SELECT!", "danger")
                    return render_template('query.html', query=query)
                conn = get_db_connection()
                cursor = conn.cursor()
                cursor.execute(query)
                result = cursor.fetchall()
                cursor.close()
                conn.close()
            except Exception as e:
                flash(f"Błąd: {str(e)}", "danger")
    return render_template('query.html', query=query, result=result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
