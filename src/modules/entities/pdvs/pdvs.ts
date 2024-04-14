import { PdvsProps } from "../../dto/partner/pdvs-props";
import { Partner } from "../partners/partner";

export class Pdvs{
  public partner: Partner

  private constructor(props: PdvsProps){
    this.partner = props.partner;
  }
}