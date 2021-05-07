FROM node:slim
LABEL maintainer="Kevin Kamani <kevinkdev97@gmail.com>"
ENV TMDB_KEY=

RUN apk add git && \
    git clone https://github.com/michaelx/media-tracker.git && \
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
