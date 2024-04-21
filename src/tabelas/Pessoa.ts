import pool from '../config/database';
import { PessoaCreateType, PessoaUpdateType } from '../types/pessoaTypes';

export default class Pessoa {

    static async getAll() {

        const res = await pool.query('SELECT * FROM pessoa');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM pessoa WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: PessoaCreateType) {

        const res = await pool.query(
            `INSERT INTO pessoa (cpf, nome, sobrenome, data_nascimento, id_cidade, bairro, cep, logradouro, numero_residencial, ddd, telefone, email)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
            RETURNING *`,
            [
                data.cpf,
                data.nome,
                data.sobrenome,
                data.data_nascimento,
                data.id_cidade,
                data.bairro,
                data.cep,
                data.logradouro,
                data.numero_residencial,
                data.ddd,
                data.telefone,
                data.email
            ]
        );

        return res.rows[0];
    }

    static async update(id: string, data: PessoaUpdateType) {

        const res = await pool.query(
            `UPDATE pessoa
            SET cpf = $1,
                nome = $2,
                sobrenome = $3,
                data_nascimento = $4,
                id_cidade = $5,
                bairro = $6,
                cep = $7,
                logradouro = $8,
                numero_residencial = $9,
                ddd = $10,
                telefone = $11,
                email = $12
            WHERE id = $13 RETURNING *`,
            [
                data.cpf,
                data.nome,
                data.sobrenome,
                data.data_nascimento,
                data.id_cidade,
                data.bairro,
                data.cep,
                data.logradouro,
                data.numero_residencial,
                data.ddd,
                data.telefone,
                data.email,
                id
            ]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM pessoa WHERE id = $1', [id]);
    }
}
