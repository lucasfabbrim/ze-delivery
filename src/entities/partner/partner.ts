import { Address } from "../address/address";
import { CoverageArea } from "../address/coverage-area"
import { uuid } from 'uuidv4';

export class Partner{
  public readonly id?: string
  public tradingName: string
  public ownerName: string
  public readonly document: string
  public coverageAreas: CoverageArea[]
  public address: Address[]

  private constructor(tradingName: string, ownerName: string, document: string, coverageAreas: CoverageArea[], address: Address[]){
     this.id = uuid();
     this.tradingName = tradingName;
     this.ownerName = ownerName;
     this.document = document;
     this.coverageAreas = coverageAreas;
     this.address = address;
  }
}