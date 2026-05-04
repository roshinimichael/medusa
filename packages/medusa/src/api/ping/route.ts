import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"

export const AUTHENTICATE = false

export const GET = async (
  _req: MedusaRequest,
  res: MedusaResponse<{ ok: boolean }>
) => {
  res.status(200).json({ ok: true })
}
