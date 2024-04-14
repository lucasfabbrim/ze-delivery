import { AddressProps } from "../../dto/partner/address-props"

export interface AddressRepository{
  create(coverage: AddressProps): Promise<void>
  save(coverage: AddressProps): Promise<void>
  delete(coverage: AddressProps): Promise<void>
}