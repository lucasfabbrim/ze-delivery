import fastify from 'fastify';

export const application = fastify();
const port: number = 8080;

const initApplication = async () => {
  try {
    await application.listen({
      port: port
    }).then(() => {
      console.log('Server running!')
    })
  } catch (error) {
    console.log(error);
  }
}
initApplication();