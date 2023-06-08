from database import get_connection

async def create_user(email):
    async with get_connection() as conn:
        query = """
        INSERT INTO users (email, created_at, modifed_at)
        VALUES ($1, now(), now())
        """
        return await conn.fetch(query, email)
