import { Partner } from "../partner/partner";

export class Pdvs {
  public partner: Partner;

  private constructor(partner: Partner) {
    this.partner = partner;
  }
}
