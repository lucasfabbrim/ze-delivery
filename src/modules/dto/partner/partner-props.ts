import { Address } from "@prisma/client"
import { CoverageArea } from "../../entities/partners/partner-coverage-area"

export interface PartnerProps{
  tradingName: string
  ownerName: string
  document: string
  coverageArea: CoverageArea[]
  address: Address[]
}