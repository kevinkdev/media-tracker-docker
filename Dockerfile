FROM node:slim
LABEL maintainer="Kevin Kamani <kevinkdev97@gmail.com>"
ENV TMDB_KEY=

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates & \
    apt-get install -y --no-install-recommends git && \
    git clone http://github.com/michaelx/media-tracker.git && \
    cd client && \ 
    npm install && \
    cd ../server && \ 
    npm install && \
    cd
    
    
EXPOSE 3000
EXPOSE 3001
 
COPY startup-backend.sh /
COPY startup-frontend.sh /

RUN chmod 755 /startup-backend.sh
RUN chmod 755 /startup-frontend.sh

CMD ["bash","/startup-backend.sh"]
CMD ["bash","/startup-frontend.sh"]
