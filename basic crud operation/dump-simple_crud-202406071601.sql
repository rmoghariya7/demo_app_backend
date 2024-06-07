PGDMP                         |            simple_crud    15.5    15.5 &    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16433    simple_crud    DATABASE     ~   CREATE DATABASE simple_crud WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE simple_crud;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            &           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16520    Blogs    TABLE     �   CREATE TABLE public."Blogs" (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    written_by integer NOT NULL,
    likes integer DEFAULT 0
);
    DROP TABLE public."Blogs";
       public         heap    postgres    false    4            �            1259    16519    Blogs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Blogs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Blogs_id_seq";
       public          postgres    false    4    217            '           0    0    Blogs_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Blogs_id_seq" OWNED BY public."Blogs".id;
          public          postgres    false    216            �            1259    16511    Users    TABLE     �   CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false    4            �            1259    16510    Users_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    215    4            (           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          postgres    false    214            �            1259    16647 
   blog_likes    TABLE     _   CREATE TABLE public.blog_likes (
    user_id integer NOT NULL,
    blog_id integer NOT NULL
);
    DROP TABLE public.blog_likes;
       public         heap    postgres    false    4            �            1259    16570    topics    TABLE     n   CREATE TABLE public.topics (
    topic_id integer NOT NULL,
    topic_name character varying(100) NOT NULL
);
    DROP TABLE public.topics;
       public         heap    postgres    false    4            �            1259    16569    topics_topic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.topics_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.topics_topic_id_seq;
       public          postgres    false    4    219            )           0    0    topics_topic_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.topics_topic_id_seq OWNED BY public.topics.topic_id;
          public          postgres    false    218            �            1259    16621 
   user_topic    TABLE     `   CREATE TABLE public.user_topic (
    user_id integer NOT NULL,
    topic_id integer NOT NULL
);
    DROP TABLE public.user_topic;
       public         heap    postgres    false    4            x           2604    16523    Blogs id    DEFAULT     h   ALTER TABLE ONLY public."Blogs" ALTER COLUMN id SET DEFAULT nextval('public."Blogs_id_seq"'::regclass);
 9   ALTER TABLE public."Blogs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            w           2604    16514    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            z           2604    16573    topics topic_id    DEFAULT     r   ALTER TABLE ONLY public.topics ALTER COLUMN topic_id SET DEFAULT nextval('public.topics_topic_id_seq'::regclass);
 >   ALTER TABLE public.topics ALTER COLUMN topic_id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    16520    Blogs 
   TABLE DATA           H   COPY public."Blogs" (id, title, content, written_by, likes) FROM stdin;
    public          postgres    false    217   q(                 0    16511    Users 
   TABLE DATA           6   COPY public."Users" (id, email, password) FROM stdin;
    public          postgres    false    215   +                 0    16647 
   blog_likes 
   TABLE DATA           6   COPY public.blog_likes (user_id, blog_id) FROM stdin;
    public          postgres    false    221   Q,                 0    16570    topics 
   TABLE DATA           6   COPY public.topics (topic_id, topic_name) FROM stdin;
    public          postgres    false    219   y,                 0    16621 
   user_topic 
   TABLE DATA           7   COPY public.user_topic (user_id, topic_id) FROM stdin;
    public          postgres    false    220   �,       *           0    0    Blogs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Blogs_id_seq"', 11, true);
          public          postgres    false    216            +           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);
          public          postgres    false    214            ,           0    0    topics_topic_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.topics_topic_id_seq', 5, true);
          public          postgres    false    218            ~           2606    16527    Blogs Blogs_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Blogs"
    ADD CONSTRAINT "Blogs_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Blogs" DROP CONSTRAINT "Blogs_pkey";
       public            postgres    false    217            |           2606    16518    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    215            �           2606    16575    topics topics_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (topic_id);
 <   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_pkey;
       public            postgres    false    219            �           2606    16651    blog_likes user_id_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.blog_likes
    ADD CONSTRAINT user_id_pkey PRIMARY KEY (user_id, blog_id);
 A   ALTER TABLE ONLY public.blog_likes DROP CONSTRAINT user_id_pkey;
       public            postgres    false    221    221            �           2606    16625    user_topic user_topic_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.user_topic
    ADD CONSTRAINT user_topic_pkey PRIMARY KEY (user_id, topic_id);
 D   ALTER TABLE ONLY public.user_topic DROP CONSTRAINT user_topic_pkey;
       public            postgres    false    220    220            �           2606    16657 !   blog_likes user_blog_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_likes
    ADD CONSTRAINT user_blog_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."Users"(id);
 K   ALTER TABLE ONLY public.blog_likes DROP CONSTRAINT user_blog_user_id_fkey;
       public          postgres    false    3196    215    221            �           2606    16652 !   blog_likes user_bloh_blog_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_likes
    ADD CONSTRAINT user_bloh_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public."Blogs"(id);
 K   ALTER TABLE ONLY public.blog_likes DROP CONSTRAINT user_bloh_blog_id_fkey;
       public          postgres    false    3198    221    217            �           2606    16631 #   user_topic user_topic_topic_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_topic
    ADD CONSTRAINT user_topic_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(topic_id);
 M   ALTER TABLE ONLY public.user_topic DROP CONSTRAINT user_topic_topic_id_fkey;
       public          postgres    false    3200    219    220            �           2606    16626 "   user_topic user_topic_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_topic
    ADD CONSTRAINT user_topic_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."Users"(id);
 L   ALTER TABLE ONLY public.user_topic DROP CONSTRAINT user_topic_user_id_fkey;
       public          postgres    false    215    220    3196            �           2606    16528    Blogs written_by    FK CONSTRAINT     v   ALTER TABLE ONLY public."Blogs"
    ADD CONSTRAINT written_by FOREIGN KEY (written_by) REFERENCES public."Users"(id);
 <   ALTER TABLE ONLY public."Blogs" DROP CONSTRAINT written_by;
       public          postgres    false    3196    215    217               �  x�]TKn1]�����4"$X�	�D :K6nwʹ�ղ���qN�Ix��$��Hn�}�ռo��v)Jll��˦�^�.Ӕ��u�@����ōg͆Ɍ�w�'1���=����e
ݵ�]�L:��T�c,w"��]s����-[�S\��wfgZ��X��*I�1�&��ӛ���F�f��}��LT�\=�����@k0�g�H{L~�&�1( ���z�q�T�G�9���
�{��wy��H��K.�%�jaub⡕�O��^(y��0FbQ���à�D��	ƻS0#vLt�������-�5��,`�x��v�g�-�=h.vU�����lӿ����t���N���}�P��K=\>r"Y׭�Ú-�������V�Q�@��^��L:���p_-�i�sܦ�@�].R�p���s1�램��EB����٤�����UM��E�Xy~����� f&�k'nL���wm9"�����z�g�W�V��ʓ�� z�{�u���+ ��9.�l��P>��;S�f��z)�I�j��B{�Ν��^	�/I}NDZ�#��>�h<�AC�%(�\��E^;6W����%��J|��p�
4�P���Ɨ�B���Ãy~+�ۯ�v�)&b��YSBF�,4�=qܸ@g�bי��J��j�X�����         /  x�e�Kr�0  �5��5�v� ��2�M�)������;�܈k���V��;n#i���t�ıa)i����0$.Q-(�% �<��e��pv;	����|�p��S��I����GB��̔Y�����m
n��-����@��MW�����v6ps���^����>���x7�w׼�j��b�%�:�jV��2��L������F��MIu&\�=I��=�Ӿ�!�̉Est��v��%#�︲�t\�kH�Y��`H��Fw�^�O�B=x�T��U�(ۧa�~��K�k�r�?�� �@~_            x�3��2bSNCC�=... �L         8   x�3�,JML.�2��(���2�L..�2���OI�*�2��J,K,N.�,(����� Vq�            x�3�4�2�4�2bCN.S ����� '�     