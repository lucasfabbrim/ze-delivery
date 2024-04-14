import { AddressProps } from "../../dto/partner/address-props";

export class CoverageArea{
  readonly type?: string
  coordinates: Number[]

  private constructor(props:  AddressProps){
    this.type = 'MultiPolygon';
    this.coordinates = props.coordinates;
  }
}