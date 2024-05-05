import Router from "express";
import {
    storeReferencias
} from "../controllers/post_referencias.js";

const referenciasRoutes = Router();

referenciasRoutes.get("/", (req, res) => {
    res.send({ message: "Referencias route is working!" });
});

referenciasRoutes.get("/populate", async (req, res) => {
    await storeReferencias();
    res.send({ message: "Referencias populated!" });
});

export { referenciasRoutes };