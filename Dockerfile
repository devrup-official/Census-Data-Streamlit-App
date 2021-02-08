FROM python:3.7-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 80
RUN mkdir ~/.streamlit

RUN cp .streamlit/config.toml ~/.streamlit/config.toml
RUN cp .streamlit/credentials.toml ~/.streamlit/credentials.toml
RUN cp config.prod.py config.py
WORKDIR /app
ENTRYPOINT ["streamlit", "run"]
CMD ["census_app.py"]
