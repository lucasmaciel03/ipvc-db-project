import Router from "express";
import {
    storeGeneros
} from "../controllers/post_generos.js";

const generosRoutes = Router();

generosRoutes.get("/", (req, res) => {
    res.send({ message: "Generos route is working!" });
});

generosRoutes.get("/populate", async (req, res) => {
    await storeGeneros();
    res.send({ message: "Generos populated!" });
});

export { generosRoutes };
