import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { PartnerProps } from "../../dto/partner/partner-props";
import { PartnerRepository } from "../../repositories/partner-repository";

export async function userRoutes(fastify: FastifyInstance){
  const partnerRepository: PartnerRepository = new PartnerRepository;
  fastify.post<{ Body: PartnerProps }>('/create-partner', async (req: FastifyRequest<{ Body: PartnerProps }>, reply: FastifyReply) => {
    try {
      const partnerData: PartnerProps = req.body;
      const createdPartner = await partnerRepository.create(partnerData);
      reply.code(201).send(createdPartner);
    } catch (error) {
      console.error('Erro ao criar parceiro:', error);
      reply.code(500).send({ error: 'Falha ao criar parceiro' });
    }
  });
}