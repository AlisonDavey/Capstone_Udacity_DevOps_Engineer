jupyter notebook --generate-config
echo 'conf = get_config()' >> ~/.jupyter/jupyter_notebook_config.py
echo "conf.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
echo 'conf.NotebookApp.port = 8888' >> ~/.jupyter/jupyter_notebook_config.py
