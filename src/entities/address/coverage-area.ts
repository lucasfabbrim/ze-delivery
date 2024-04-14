export class CoverageArea{
  public type?: string
  public coordinates: number[]

  private constructor(coordinates: number[]){
    this.type = 'MultiPolygon';
    this.coordinates = coordinates;
  }

}