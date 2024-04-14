import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { PartnerRepository } from "../../repositories/partner-repository";

export async function useRoutes(fastify: FastifyInstance) {
  const partnerRepository: PartnerRepository = new PartnerRepository();

  fastify.post<{ Body: { id: string } }>('/delete-partner', async (req: FastifyRequest<{ Body: { id: string } }>, reply: FastifyReply) => {
    try {
      const { id } = req.body;
      await partnerRepository.delete(id);
      reply.code(200).send({ message: 'Parceiro excluído com sucesso' });
    } catch (error) {
      console.error('Erro ao excluir parceiro:', error);
      reply.code(500).send({ error: 'Falha ao excluir parceiro' });
    }
  });
}
