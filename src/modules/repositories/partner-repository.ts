import { PartnerProps } from "../dto/partner/partner-props";
import { Partner } from "../entities/partners/partner";
import { PartnerRepositoryInterface } from "./interfaces/partner-repository-interface";
import { prisma } from "./prisma-config/prisma-client";

export class PartnerRepository implements PartnerRepositoryInterface{

  create(partner: PartnerProps): Promise<Partner> {
    try {
      const result = prisma.partner.create({
        data: {
          ownerName: partner.ownerName,
          document: partner.document,
          tradingName: partner.tradingName,
        },
      });
      return result;
    } catch (error) {
      throw new Error(`Failed to create partner: ${error}`);
    }
  }

  findById(id: string): Promise<Partner> {
    throw new Error("Method not implemented.");
  }
  save(partner: PartnerProps): Promise<Partner> {
    throw new Error("Method not implemented.");
  }

  delete(id: string): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      prisma.partner.delete({
        where: {
          id,
        },
      }).then(() => {
        resolve(); 
      }).catch(error => {
        console.error(`Falha ao excluir parceiro: ${error}`);
        reject(error); 
      });
    });
  }
  
}