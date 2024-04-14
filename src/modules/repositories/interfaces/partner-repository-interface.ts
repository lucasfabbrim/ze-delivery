import { PartnerProps } from "../../dto/partner/partner-props"
import { Partner } from "../../entities/partners/partner"

export interface PartnerRepositoryInterface{
  create(partner: PartnerProps): Promise<Partner>
  findById(id: string): Promise<Partner>
  save(partner: PartnerProps): Promise<Partner>
  delete(id: String): Promise<void>
}