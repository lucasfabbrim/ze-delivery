import { PartnerProps } from "../../dto/partner/partner-props"

export class Partner{
  public readonly id?: string
  public tradingName: string
  public ownerName: string
  public document: string

  private constructor(props: PartnerProps){
    this.tradingName = props.tradingName;
    this.ownerName = props.ownerName;
    this.document = props.document;
  }
}