import { PdvsProps } from "../../dto/partner/pdvs-props";

export interface PdvsRepository{
  create(pdvs: PdvsProps): Promise<void>
  save(pdvs: PdvsProps): Promise<void>
  delete(pdvs: PdvsProps): Promise<void>
}