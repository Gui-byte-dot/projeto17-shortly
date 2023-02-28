PGDMP     ;    7                {            shortly    15.1 (Debian 15.1-1.pgdg110+1)    15.1 (Debian 15.1-1.pgdg110+1)                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25968    shortly    DATABASE     r   CREATE DATABASE shortly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE shortly;
                postgres    false            �            1259    34182    sessions    TABLE     P   CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    34181    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          postgres    false    217                       0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          postgres    false    216            �            1259    34194    urls    TABLE     �   CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    visits integer DEFAULT 0 NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.urls;
       public         heap    postgres    false            �            1259    34193    urls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.urls_id_seq;
       public          postgres    false    219                       0    0    urls_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;
          public          postgres    false    218            �            1259    25970    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25969    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            s           2604    34185    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            t           2604    34197    urls id    DEFAULT     b   ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);
 6   ALTER TABLE public.urls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            r           2604    25973    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    34182    sessions 
   TABLE DATA           0   COPY public.sessions (id, "userId") FROM stdin;
    public          postgres    false    217                      0    34194    urls 
   TABLE DATA           R   COPY public.urls (id, url, "shortUrl", visits, "userId", "createdAt") FROM stdin;
    public          postgres    false    219                      0    25970    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public          postgres    false    215                        0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 13, true);
          public          postgres    false    216            !           0    0    urls_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.urls_id_seq', 3, true);
          public          postgres    false    218            "           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 12, true);
          public          postgres    false    214            |           2606    34187    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    217            ~           2606    34203    urls urls_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_pkey;
       public            postgres    false    219            �           2606    34205    urls urls_shortUrl_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");
 B   ALTER TABLE ONLY public.urls DROP CONSTRAINT "urls_shortUrl_key";
       public            postgres    false    219            x           2606    25980    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            z           2606    25978    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    34188    sessions sessions_userId_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "sessions_userId_fkey";
       public          postgres    false    3194    215    217            �           2606    34206    urls urls_userId_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.urls DROP CONSTRAINT "urls_userId_fkey";
       public          postgres    false    219    215    3194               0   x�3�4�2bNC.S 6bs � bK 64 J�XF Hm� �T         �   x�u�M
�@ ���)����͏9��""*S�E 9	��c�R����� P޶�Q�ݝ]]�I��Q��֢�ޛ=��ɺ6�!��0�\	PTWJI=���~k�B�0�M�2̦��'��w�\JӁl^FI\�o�0Ov����ͨ�!<��`��˛?S         �  x�]�ǲ�X @�1|�#Y����%x��	 �	��?��]���=���!,���1��-�C'?�Ss|鼳z >w�J�J_�4k>H��=D�M��P��;i�2u'px�޸u]�8�q�K�n����Ⱦu�D������Bz�&P��<���t�����$��$�禓�*t?8\���x�����	����(B�� :ϺE
�����X��0͞�̣�|Q{�+
�?D1�:���q7�%Ը�"��d��r�6���Ɯ���XT��0*0 �;f�#^B�S�"�N@��	�<�{�J8,�o�e�k�2Sŉ+~�Y�e�%�ΐ��M��^_�/����kN�C�?n����xE���ՙ������%}�B�njN߆��z.S���52%6�Ǌb�u�J��S��j�wTZ�	����3�Z�������<��m||�i@l�+�f�r0�`��׳mh9����"�"W�V��P��O��<�dpK��M0�v�J�	n��k�d#�@P&�6���a�����Ϛ\P�F�$�*NQ����i��
u p�EY'k���[���c�䐴3]��7VL�UF8��[`]�8pt��Ss实�r��n_1<���x���,�~{�B�M!MKP��?��_(�     