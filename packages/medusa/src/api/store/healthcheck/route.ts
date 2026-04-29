import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import { version } from "../../../../package.json"

export const AUTHENTICATE = false

export const GET = async (
  _req: MedusaRequest,
  res: MedusaResponse<{ status: string; version: string }>
) => {
  res.status(200).json({ status: "ok", version })
}

export const POST = async (
  _req: MedusaRequest,
  res: MedusaResponse
) => {
  res.setHeader("Allow", "GET")
  res.status(405).json({ message: "Method Not Allowed" })
}
