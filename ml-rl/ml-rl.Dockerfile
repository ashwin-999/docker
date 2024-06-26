FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    build-essential \
    cmake \
    git \
    curl \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    xvfb \
    ffmpeg \
    freeglut3-dev \
    wget \
    swig \
    libosmesa6-dev \
    patchelf \
    libgl1-mesa-glx \
    libglfw3 \
    libglew-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install torch==1.9.0 torchvision==0.10.0 torchaudio==0.9.0

#RUN pip install lockfile==0.12.2
#RUN pip install glfw==1.12.0

#RUN pip install mujoco_py==2.0.2.13

#RUN pip install gym==0.18.0
#RUN pip install gym[atari]==0.18.0 gym[box2d]==0.18.0 gym[classic_control]==0.18.0 gym[robotics]==0.18.0

RUN pip install stable-baselines3==1.0
RUN pip install pytorch-lightning==1.3.8 
RUN pip install rl-coach
    # ray[rllib]==1.6.0 \
    # tensorforce==0.5.5 \
    # tf-agents==0.9.0 \

    # tianshou==0.4.5 \
    # pettingzoo==1.11.0 \
    # supersuit==3.3.5 \

    # baselines==0.1.5 \
    # dopamine-rl==3.0.1 \

# gym[box2d]==0.18.0

RUN pip install jupyterlab==3.0.14
RUN pip install matplotlib==3.4.2
RUN pip install seaborn==0.11.1
RUN pip install plotly==4.14.3

EXPOSE 8888

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]