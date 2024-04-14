interface AddresProps{
  type: string
}

export class Address{
  public type?: string
  public coordinates: number[]

  //Point - type
  private constructor(coordinates: number[]){
    this.type = 'Point';
    this.coordinates = coordinates;
  }

}