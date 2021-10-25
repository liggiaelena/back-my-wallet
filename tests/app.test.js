import app from '../src/app.js'
import supertest from 'supertest';
import connection from '../src/database/database.js';

describe("POST/sing-up",()=>{
  beforeAll(async()=>{
    await connection.query(`
    INSERT INTO users (name, email, password) VALUES ('liggia','abacate@abacate.com','12345');
    `)
  })
  afterAll(async()=>{
    await connection.query(`
    DELETE FROM users WHERE email = 'test@test.com';
    `)
    await connection.query(`
    DELETE FROM users WHERE email = 'abacate@abacate.com';
    `)
  })

    it("returns 400 when input is invalid", async() => {
        const body = {
          name: "liggia",
          email: "errado",
          password:"12345"
        };
        const result = await supertest(app).post("/sing-up").send(body);
        const status = result.status

        expect(status).toEqual(400);
    });

    it("returns 409 when email already exist", async() => {
      const body = {
        name: "liggia",
        email: "abacate@abacate.com",
        password:"12345"
      };
      const result = await supertest(app).post("/sing-up").send(body);
      const status = result.status

      expect(status).toEqual(409);
    });

    it("returns 201 when user sing-up", async() => {
        const body = {
          name: "liggia",
          email: "test@test.com",
          password:"12345"
        };
        const result = await supertest(app).post("/sing-up").send(body);
        const status = result.status

      expect(status).toEqual(201);
    });

});

describe("POST/sing-in",()=>{
  afterAll(() => {
    connection.end();
  });

    it('retuns body for a valid user', async()=>{
      const body = {
        name: "liggia",
        email: "abacate@salgado.com",
        password:"12345"
      };

      const result = await supertest(app).post("/sing-in").send(body);

      expect(result.status).toEqual(200);
      expect(result.body).toHaveProperty("token")
    })

})