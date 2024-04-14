import { AddressProps } from "../../dto/partner/address-props";

export class Address{
  public readonly type?: string
  public coordinates: Number[]
  
  private constructor(props:  AddressProps){
    this.type = 'Point';
    this.coordinates = props.coordinates;
  }
}