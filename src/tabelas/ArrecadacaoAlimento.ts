import pool from '../config/database';
import { ArrecadacaoAlimentoCreateType, ArrecadacaoAlimentoUpdateType } from '../types/arrecadacaoAlimentoTypes';

export default class ArrecadacaoAlimento {

    static async getAll() {

        const res = await pool.query('SELECT * FROM arrecadacao_alimento');

        return res.rows;
    }

    static async getOne(id: string) {

        const res = await pool.query('SELECT * FROM arrecadacao_alimento WHERE id = $1', [id]);

        return res.rows[0];
    }

    static async create(data: ArrecadacaoAlimentoCreateType) {

        const res = await pool.query(
            `INSERT INTO arrecadacao_alimento (id_alimento, data_validade, peso, id_pessoa, id_condutor, id_deposito)
            VALUES ($1, $2, $3, $4, $5, $6)
            RETURNING *`,
            [
                data.id_alimento,
                data.data_validade,
                data.peso,
                data.id_pessoa,
                data.id_condutor,
                data.id_deposito
            ]
        );

        return res.rows[0];
    }

    static async update(id: string, data: ArrecadacaoAlimentoUpdateType) {

        const res = await pool.query(
            `UPDATE arrecadacao_alimento
            SET id_alimento = $1,
                data_validade = $2,
                peso = $3,
                id_pessoa = $4,
                id_condutor = $5,
                id_deposito = $6
            WHERE id = $7 RETURNING *`,
            [
                data.id_alimento,
                data.data_validade,
                data.peso,
                data.id_pessoa,
                data.id_condutor,
                data.id_deposito,
                id
            ]
        );

        return res.rows[0];
    }

    static async delete(id: string) {

        await pool.query('DELETE FROM arrecadacao_alimento WHERE id = $1', [id]);
    }

    static async pegarTotalArrecadadoPorAlimento() {

        const res = await pool.query(`
            SELECT alimento.id AS "ID Alimento",
                alimento.nome AS "Nome Alimento",
                SUM(arrecadacao_alimento.peso) AS "Peso Total Arrecadado"
            FROM arrecadacao_alimento
            LEFT JOIN alimento ON alimento.id = arrecadacao_alimento.id_alimento
            GROUP BY alimento.id;`
        );

        return res.rows;
    }
}
