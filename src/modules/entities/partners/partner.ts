import { Address } from "@prisma/client"
import { PartnerProps } from "../../dto/partner/partner-props"
import { CoverageArea } from "./partner-coverage-area"

export class Partner{
  public readonly id?: string
  public tradingName: string
  public ownerName: string
  public document: string
  public coverageArea: CoverageArea[]
  public address: Address[]

  private constructor(props: PartnerProps){
    this.tradingName = props.tradingName;
    this.ownerName = props.ownerName;
    this.document = props.document;
    this.coverageArea = props.coverageArea;
    this.address = props.address;
  }
}