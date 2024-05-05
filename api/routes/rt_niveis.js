import Router from "express";
import {
    storeNiveis
} from "../controllers/post_niveis.js";

const niveisRoutes = Router();

niveisRoutes.get("/", (req, res) => {
    res.send({ message: "Niveis route is working!" });
});

niveisRoutes.get("/populate", async (req, res) => {
    await storeNiveis();
    res.send({ message: "Niveis populated!" });
});

export { niveisRoutes };
