PGDMP                         {            LangSequenceTraining    15.3    15.3 !    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16398    LangSequenceTraining    DATABASE     �   CREATE DATABASE "LangSequenceTraining" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 &   DROP DATABASE "LangSequenceTraining";
                postgres    false            �            1259    16411    SequenceGroup    TABLE     �   CREATE TABLE public."SequenceGroup" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Description" text DEFAULT ''::text NOT NULL,
    "IsHide" boolean DEFAULT false NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
 #   DROP TABLE public."SequenceGroup";
       public         heap    postgres    false            �            1259    16404 	   Sequences    TABLE     �   CREATE TABLE public."Sequences" (
    "Id" uuid NOT NULL,
    "Text" text NOT NULL,
    "Description" text NOT NULL,
    "SequenceGroupId" uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    "Order" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public."Sequences";
       public         heap    postgres    false            �            1259    16425    UserSequenceProgress    TABLE     5  CREATE TABLE public."UserSequenceProgress" (
    "Id" uuid NOT NULL,
    "SequenceId" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "StartTime" timestamp with time zone NOT NULL,
    "LastUpdateTime" timestamp with time zone,
    "Stage" integer NOT NULL,
    "LastSuccess" boolean DEFAULT false NOT NULL
);
 *   DROP TABLE public."UserSequenceProgress";
       public         heap    postgres    false            �            1259    16464 	   UserState    TABLE     s   CREATE TABLE public."UserState" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "State" text NOT NULL
);
    DROP TABLE public."UserState";
       public         heap    postgres    false            �            1259    16418    Users    TABLE     R   CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �            1259    16399    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false            %          0    16411    SequenceGroup 
   TABLE DATA           Y   COPY public."SequenceGroup" ("Id", "Name", "Description", "IsHide", "Order") FROM stdin;
    public          postgres    false    216   �(       $          0    16404 	   Sequences 
   TABLE DATA           ^   COPY public."Sequences" ("Id", "Text", "Description", "SequenceGroupId", "Order") FROM stdin;
    public          postgres    false    215   �)       '          0    16425    UserSequenceProgress 
   TABLE DATA           �   COPY public."UserSequenceProgress" ("Id", "SequenceId", "UserId", "StartTime", "LastUpdateTime", "Stage", "LastSuccess") FROM stdin;
    public          postgres    false    218   �n       (          0    16464 	   UserState 
   TABLE DATA           >   COPY public."UserState" ("Id", "UserId", "State") FROM stdin;
    public          postgres    false    219   #r       &          0    16418    Users 
   TABLE DATA           /   COPY public."Users" ("Id", "Name") FROM stdin;
    public          postgres    false    217   T}       #          0    16399    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    214   �}       �           2606    16417    SequenceGroup PK_SequenceGroup 
   CONSTRAINT     b   ALTER TABLE ONLY public."SequenceGroup"
    ADD CONSTRAINT "PK_SequenceGroup" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."SequenceGroup" DROP CONSTRAINT "PK_SequenceGroup";
       public            postgres    false    216            �           2606    16446    Sequences PK_Sequences 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "PK_Sequences" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "PK_Sequences";
       public            postgres    false    215            �           2606    16429 ,   UserSequenceProgress PK_UserSequenceProgress 
   CONSTRAINT     p   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "PK_UserSequenceProgress" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "PK_UserSequenceProgress";
       public            postgres    false    218            �           2606    16470    UserState PK_UserState 
   CONSTRAINT     Z   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "PK_UserState" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "PK_UserState";
       public            postgres    false    219            �           2606    16444    Users PK_Users 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "PK_Users";
       public            postgres    false    217                       2606    16403 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    214            �           1259    24676    IX_SequenceGroup_Name    INDEX     \   CREATE UNIQUE INDEX "IX_SequenceGroup_Name" ON public."SequenceGroup" USING btree ("Name");
 +   DROP INDEX public."IX_SequenceGroup_Name";
       public            postgres    false    216            �           1259    16458    IX_Sequences_SequenceGroupId    INDEX     c   CREATE INDEX "IX_Sequences_SequenceGroupId" ON public."Sequences" USING btree ("SequenceGroupId");
 2   DROP INDEX public."IX_Sequences_SequenceGroupId";
       public            postgres    false    215            �           1259    49490    IX_Sequences_Text    INDEX     T   CREATE UNIQUE INDEX "IX_Sequences_Text" ON public."Sequences" USING btree ("Text");
 '   DROP INDEX public."IX_Sequences_Text";
       public            postgres    false    215            �           1259    16440 "   IX_UserSequenceProgress_SequenceId    INDEX     o   CREATE INDEX "IX_UserSequenceProgress_SequenceId" ON public."UserSequenceProgress" USING btree ("SequenceId");
 8   DROP INDEX public."IX_UserSequenceProgress_SequenceId";
       public            postgres    false    218            �           1259    16441    IX_UserSequenceProgress_UserId    INDEX     g   CREATE INDEX "IX_UserSequenceProgress_UserId" ON public."UserSequenceProgress" USING btree ("UserId");
 4   DROP INDEX public."IX_UserSequenceProgress_UserId";
       public            postgres    false    218            �           1259    24674    IX_UserState_UserId    INDEX     X   CREATE UNIQUE INDEX "IX_UserState_UserId" ON public."UserState" USING btree ("UserId");
 )   DROP INDEX public."IX_UserState_UserId";
       public            postgres    false    219            �           1259    24675    IX_Users_Name    INDEX     L   CREATE UNIQUE INDEX "IX_Users_Name" ON public."Users" USING btree ("Name");
 #   DROP INDEX public."IX_Users_Name";
       public            postgres    false    217            �           2606    16459 4   Sequences FK_Sequences_SequenceGroup_SequenceGroupId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sequences"
    ADD CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId" FOREIGN KEY ("SequenceGroupId") REFERENCES public."SequenceGroup"("Id") ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."Sequences" DROP CONSTRAINT "FK_Sequences_SequenceGroup_SequenceGroupId";
       public          postgres    false    216    215    3206            �           2606    16479 A   UserSequenceProgress FK_UserSequenceProgress_Sequences_SequenceId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId" FOREIGN KEY ("SequenceId") REFERENCES public."Sequences"("Id") ON DELETE CASCADE;
 o   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Sequences_SequenceId";
       public          postgres    false    218    215    3203            �           2606    16452 9   UserSequenceProgress FK_UserSequenceProgress_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserSequenceProgress"
    ADD CONSTRAINT "FK_UserSequenceProgress_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 g   ALTER TABLE ONLY public."UserSequenceProgress" DROP CONSTRAINT "FK_UserSequenceProgress_Users_UserId";
       public          postgres    false    3209    218    217            �           2606    16471 #   UserState FK_UserState_Users_UserId    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserState"
    ADD CONSTRAINT "FK_UserState_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."UserState" DROP CONSTRAINT "FK_UserState_Users_UserId";
       public          postgres    false    219    3209    217            %   �   x��ϱm1��4�-��")J�%����p�r�>3R�YA��2�����|<P$X��B�Ɂ�Z �h��>�W��1^����׸�v���4^�ϼϵ���~��>�q��=N�Ŝ�Ś쫊ADJ
�U�rm��۞��M��$�8*vѪ�-!��긨���O�M-��|�$�y#.. �k�Ӟ��LJ��**XI���!5/���d�}�SnR�<?c�'	�      $      x��}[oYv��+*~��%�~�Kcr��A� ��XU�S�BRVk�,���I����I$�3I��4Zm��@����e_kY�� ��,RU{����~k�r��M�q7���ݰ�n5�v���J�l4�^Zk�z;Ӄh�48��xg��������r<�>y,�������v�z�au���^��Vo��������{������^|[����V��R���r&>�_>�?y�\�����~y#>�O�sx�|y�_�X.��R ���|'���-"�*�p!��׫�{��w���x�����h�����x�B��^����z)v2����չ�.>|��뀷>Ox��^��~'��kx�Z�nQlO�c�"�??<��߉��`���H������N����^��M ����V߈?z�:Ǉ�w+�.�R��{�l�H�8�RGD�_Ǐ�4���V/Ň��@�����_�z���t����9s�.���O~a��w���'�O��7Cz������z[Q�\��ifXֻ�u�G�eV2=H���Y:8���i�z�%��~��=2>�^������,�N-E��g1���p�4����i:N���S�―J�����@9f9\��(}
W~M< i�û	�:�պ.�����a�x(|9��{ģ?&�x2�����Z�'}Ļ�6�3ߒ�O�Y��|ap/�Ĳ���8Gܴ�H�KX�qma�p������>m���ko���\���G��
Wo�����7P�./J�->y��D\�獫��#A��[�E�e�%���p���|/���;��jb�7��<�[!�^��v��v�U�*a܍a���a[�*�&ո�j���F�S٭D�v'n�mv�z�W��j5l�q�u:�V���'��A�O�Y��+��'���h7��h��n%�(IjŢbL� �6�X��DG�o�G ggȯkT�%ޗAU^�q��FX�x�w �W�
��K/�V�PM�o��B��8�,B�%��ߊ[��xŭ��R�i��fH�[<�*�{���R*O��Vߊ_�\�?)������I�߬e⅀��#O�p���mԓ��h,TG�_�*�� �'����R=/V߉�;'�ċDM�_�yM�s�W��{�����<��FO��ƣ�!���њ%�a�{}N���ޣl��7^i�)p���������F��0���F���0�
Ŗ��)����2`��fJ5��*
-�T�/�ּ\��f�r�u�xG#~s���އ�x7���l�Yҟ���`4�Na��&���Z��Ip(%,D��X�7��j��-U���Y�DV�߃����fxˀ�o���^����l�y�N|�N^Ӆ�xl�
`yI��_�� k,����������ꀄsR���p@����VpEu7��:B;��n�.�Vk$a�NMR�q��6����A?>��ov���R�O87�ȗ�7�*&\�i�K��cX�8�V9iS��3�"��+�f&�8U��(,>Hy�g��f�t�� t�`Z�΀��G��_���`A���'Ù���?#��\��6/��5�%�o&�ZE�WF�q�5���"��3�|[��|D��T���-�n�O~�2N0��#!�C!XN�_��g� �Am�Ľ�{M�4�K�!��8	�=�>���J|P��;�b�G�p&�"lqN��w['�)H�A�����I0�����~����_۰Z S��@��)J�6���a���4�c�
��a�|����x�w(�y�kЯ�o|MGG���ё�<H�I�=V�ڂN?��Q"���7d,���$ɽ@yr�z����E8��?�+x ���~��7Q}�]�V6������q�)�f�,B��D����
 �Iڟ�'i0��̕��VB!����@Ľ���=��R�_�EZ�Q$	$H�������:�[�����H�]����IJ�vc=�z\	�@�+=���v���مQLa�v�8n��j'lV۵�ލ�ۉ�v�*�ThΝh�'��`Գ���IE�V�r��`��R�P{�2��<;��>�+�1	zZ�.����6��'�3����m�'�n���df������8|�K���n�4�<���"��jP�,s�;�r0��_�p��/t��~}����yj��d:N�i	"5_�$�|�����x�Q��H��I�[�|�g�t���+)� �ö,J�P���yl|��Pq>���{	8	��?<�����l	$\*�9ᮜf6�~�;I*EǷ�s�+ԲB�E���n�����+�J3�
c�C�(BB�l� 	
|?/iˋ��E~�'��h8=('ip<9��S��gp��4:�H#G�l
�a��r��"�g��H�U�k�-��p�
��{��ݿIp����(����S��d�i��)��;kX�%\�K|�Н%�%����[� ߽�b����7��_{6/��<0poP��F�aG-�0�w�����V�^��J<���`���Xk���������xD��D�H�8kf���B.���=�A�,>L��p��Bk��nX-���N=*���dtA��R;we}���]�/�+�[w�� #e���^򼒭Vx����iT ��d�A*��Q�6 �qcղl����N�鰠�b[��)���{�6�`#~�i�En��׉6��S3�/t�R2��xR�T ��J����������>B����&������C��"s�~�!uqΜ��O�f�/��7��Y�/�+�B/p��:�h*29��7/b�����{CJ��T7��3� !�� ��� ka��\��cz�_�>z�d�F�څ��a]��8���N#`3���>B�y׆Z���ș�Q����ˏ�0���t$��u[�,���8�Y,s�w���b:��s�\�H}.)��Q�@�[IG�h���. W���V�ȴ&����hs��j��n�ht�I�&���Z���f#
+��Ө4������N�%!�ȓ�0��SHশv�}���Qb?���+��[�:���9�G��2֠�|�����:`��Ќg���[y����^�-\L!X1�MQ��*8nч��� �c��qK���]QH��2�|-ȶy|~���}\zf?���ڍ�cpl��l��mQZ��<i&���䕉e��1���<��a��TZ���𼻛�F�_.�?�6x:D�^O���{�I:���&H�"@H�������qvB������/DV�z�#�v��M30k�ʽ]1��^����=���&Oӄ|�4>���8������H�*xgA��(��1>%0�&0ҷ,�o���@h
@�Q��R��^0� �IȨ�a�������ZX4�P� i8cKw�	�{�}P^҄���o=��ɗd��_:�?��0���?zKZZ��_�j抑��[�� %�6���N#�(J�*+wA��m�keP���ܲ��[�1�m9�j����N�E�Z��N;�w�ݰ�T�a-n���Z�׫E;��n����J���I֢0���^��Z�rԭ��; \Щt`'�ﷃH��ڀ�&�X�6=��̀���ු[&ە�nQLx%��V��A�Y��]�݌c��V��SS�:��
G���h�T�k!��菣ap4�N�g�$
3:L'(s��4�b�d�G_�Xb��~�"�:r^�7o����&Q�|E7�R�S���<�'B�:���%{l��!]N0J��4LN1��*<��$%&A�u:���T����A4�"	�-������x�A��Mv�Kr6H��0�@��J�'C�t*�u������L�{I����������ۿ2��B�
���0H�(.N*����z���A�`��H���Ѳ�>r�4I(��2��v������s��~v5e��72�N�;�Q�q��s@�����[�"���[F�i��-��?�IvfITr�3����v,��-ճZ�O�䕤�OKr���{�b ������X�u$�O	a���*��*�i9i��J��v'�w[P"P���J�^n���Z��    ���`�j<��O�J0�Z%�ف�d�#��:7"��]Z��O���,�i()84�U(� ��ac���	��*B?w���)�b/%Ca/���\���پ�C�u&QC
��:��1�t/�*���w5�p�ʤE����`����67���\sg���SH�����x+g�M%l\/H�1��z��#���
K��?�rzy(��ѓ���b���~�x 	˽�%�Q4~�d�(T��*c�X첆D1�y�����w�o�D]o��W}�&����R�A?N-����4MJ�&���p� �&��;7����B�~�6��П����:�ܡK,��ޓA�%\g��38�9��y1L��G��D���~��w�i�	��o��=%��)uM����m
�:�[Q�T��T�i�k��J5���f�v+�$l6k�z�עVo���4��p�����/�@��=�@e�������.W�|e�Jf��d�
�<*<J�H���˜�*S/b�@uكΊ�
���]f��e�~�O1�D���� �b�`����f�7V�c���w5�7 9�2=NNZ�����t9���Ù��H�"g�.K1�|�A�����XF�Vp0`��b�*�$����Т��O:���"_g��'��g"xE��w��o f�>p����-��r%N�D���0D}��` .�	B4�La�.�-���L���.�oLk�vk�r+)��PH�X��zK��^#�u�z��4�Jw'�@uI:9L3?�͒�(W��ixs�F=��=H��9�]c=�LC��9V��W�I�]�1 �+T1
 ��,9�2k-7g��C-��K-MU��%��I��K�1}��3�=;�QH�x4��1��'*��� M��r�Z�)$#�|R�
{�Sxk@� ��)0��S��ov���a��K��΍��l�ZI=HS�����ү���~W0M��N�#!������(A�x����������5ėdDQ~%gٖ$�g̿֊	 ���48JGG��"	�4��5F�����937/t�G>�0I�1R�_��G� �e�B�)�:#�[�B��z�3����H@C�,�ۖ��r+�F�)%bfѕ�޸�9���&{8"pc��X���of�KX��!|w���Yo�ka�����vj�fX���j�RN�no��[�t;q����V9z��;�$���H��^��Vw&�i0�K�ި;:���<���e5����fq�DتTRl���z3q�rf��$�^0֟I��}����'���¡�P�A$���0=����dx%����\�E=�,�m��?��� d��"���G鸟
�@�Q�C��O�^?�[�/�B(�T��̺O2�fA���nb��T��H)YK�Gs+�����r��t�e*���Is�e����5Ee;O�Bl�S"��0 ��d�Г�?��� c�M�������D�(�@JX�	�P��s����yS�N�=,��E�# .�UWR�����ax��|� {�5�9f�G0��ێN��~��a�~0`���%Z����1&�Xͽ����'��q�焌j�P(o� ��@���iHaf����K�Q*
2�X�*��Q��-.o�����)X��
;�?�Y����;��O�L] ��zn�(bb:�\��ֲC�=���b*.���G$��瞔�W�)���3����k��O���zǕA�M�셫��U��?�*�@��$�͵������s;�'��j�ZI�N=�6�(�w!dY-�a�4+�r��Z����®�&�'�&Ɇ@^��!ӻ~<]�c�9�º���4
��틢�Md����3̮��L���r�
�~a����qW$߫�tW���E��V.�}��2@����d%Də��)�����L�
4w�u�+:GO���HBp�+g92M�E��	sN���os��7�n�h�j�Ӻ�-�7艟Y�o�#�fY��5�c��D��5�[P\s+�B���<f��ǝ�~���lG�9&����Y�nrh��	ei:M�|%�j��}�0m�؜K�Yh�j/
�Zq�.|h�0��h?D�-�A�9�X����H�v��l�!U���v�R�^�ۨ�c!ࣝ>ؽ��(�F�%��
��2g�{g�J%I����5 �W,�,��Gm�<�����e���ަ��b���=�p]LgN!����v�T�㨌v(�2|��8"�U�Qo�)���Z���$\����g� ��I
��/�F����(.�e���j5W��k89�a�0]@YR�xbGr��B�x|�z�龃s�B$��^0�Xͧ�5�� -�����!Fx8@+Pjd�����E@�Ƥ��1T�H�Cj#��,�@�H5�R1DO���'d�+y�_�M� { �ĬÇ^���H���A�M��q?��^��8�tO���:9&��V��+U�рwH4��]%DU?q�]~ͺ���]��܇,��X��!#U-��:���Y�
I'G�i��?��`��\�"�RFBU�t��+�@9����_�r�#�L50q�ي`;N��F�}GtF0�q/%��F��GD�}�������"f���}��4���K�`t��R����Lr�e~fp��۶�쪒Ѵ�z&_����Ksj�]%U�&i�v��z�ZM¸w�M�t�v��
��4n����k;_��$`��Η��-k�+Z��/��u���tۜ��e��!�����\�7����t�A���T���򿑥-|��Y�q�M��Wo�ђۘ�e�����Yw�j+�K���`�B�<&4�V���Y¹�֊l]`tކ�|n=/Q�W���z>�'�f�>�n�i��\&Գ����<���$��ӆW
���4P�?� ��"d�k���*�j�N!#'�d�b�\v��M҉зS�.pKi?�_Q�����S��F~����T��٭P�8ۻ��䫥���������(�l�QfwnʗȆ�����liu .��:��FRO�f/�'i=���j؍��݉;iԬD�Nm�$�B�d�i~��z�� ��+����$�/T��](�q�+@|T�if��~�o���Y;"ӈζ/|�^_���øW`�����APIv�@x��t"av��Zw즑4f���5�;��w2}�^;Gi�(磉�wH#W�V~R�)��:n����5�S	z������@��Cv/�'�AF��s�u�V��{�����.�6�!��\W�s��ET��ȚeUR�g���CĤ�'�~�E�vd�)�ˈ�:�X�.th2��^`qꗦR9��8b���]�����'���>�L+"]�|��ub!����e����h����X
�Ƚ���x�7i<���~�)����5�(58N|R�js ��h9��;q����n�Gp�u�������&G���ȎZ�Je�q�ܖ���.�x�"��o���Dg�lʓVv���U��q��j�}m�Ұ��Za��t�JO<�����PqFCǃ�>+�e�	����K����s<�����[�Wv��Ǌu2h&!BN?��ܒI��Uɚ�/�B1
S��G �9��/ҡЕ��>'ԩ6��)H'�bt� OZ�x4$�u\��o�v�h��v�u��Wzcz��7)έ�l0ы�Bn+9���׬1 ��d�;��7>HY�ܖ��8�o�`��\yp��K.= �3H�ҿ%��Ҁ�VK�#�Kc �=\�@�灳�,jLg�8�h)@����R���[G�U�Wnq�
�i�&CK&`�����߱��� E�~�8�.�Ha��Ձx���1�Z��3�.3���#�J����\-�D�e<8�u��;.;��03�A�7�- Q�p�e�6z��8���PΏQ7h�����S��/Ѩ�O��7�[�m3��qԆ��i��R�E=���ҙ��z�Z�D�(��ڑЙQ-l7�0�U;�V�[�����G�8%���k��̀����3�����|�2�q
���z*#��(/���    �R᷍�� cpM�i=��HutN�&��4[pd��˃��%�#�
{��9x�O򟈞��j��#��Ӕ�Sa����q)H���`�$��}������'J��Ƴ�x��PA܌8,kó����g��U��!}�\#Yg`�;羦C�bQ��.W��z��/~jp��W���xw�ST>�݀b���� ܨ׃�y�Q,t��(�H5�a�������zV!j`�px�GZ�(�9�d�
�{N��rr��n�粳�T�:(�۹��?�k�h��2�$\��p�(�<y
�d<�@�	d�'��I<Nӡ�O��ZhCv��;�̎��v02yK��1,�i"���H5��}��Och�{HPɒ�fv����<4��5�9ۑNoh9����)�>��5��-�)}(�M��fџ׼�u��U���g.yA�X�m�I��j��J���j%�v;QX�T��z�٭���J���t�M%ďYo��x{�m��G��p���L����<�[J�I���\���ް1�:
��M�@� *��U�+i��w�9�@�;g�%��x�;3����01{k��:I�#�sj]쥡T���c��ۜ	�
dz�}˜����W�jL�l��u��*b��[�ս�����Pd��␷�No�N���'X;V��#� 17��(\8�n��Aj����u�\$o��Ƌ���X�K��m�K�l�un���:τ�'~��%�7�X-W��.	$�)����)=�L��L��<�/�u��X�l��3���V׻[�Z耫	d�3?�i��m?����,Q���7�3Z=dJxq��]bgH"��P��BZ���L;�N��kQ7�vv�rM8w�$�%i�\Mw�sn!����c1�9!B7���$��ҳ��sibkCBNBZ��b�vڇ4�PR�m?�u�v؇�����rf�]>d�-Z�9��-I��D�g%�v�&X��T�P��雤QQy����:�� Xh�pxL��S�F7LG�7�"�hsJ�)~��%B���X�@Hͽ�	7��"N]��?k��*��Q�����%N����2^k�Xh�&T����r]'ӄ@�W8��Z��q���S�G�B�ǁs��\�6��3�I��|�P�jA��E;��'�Gc�
�-}�J}�����x/?P������X�T���V3	P�����[��b���G7����ԜB���E�L���h믌�-�o�����a����Qr��b�D[�o�ŏL9����UQT�Z�~�ɹ~Z0�X�m��NҎ�v��Q|�ӊ:a9N��N��D�HN7�D���8Tn��(�Dhye�MQVV-M&�M�E	wp����+����/�����Jw�: 3`�� 7��17>���s�d��z�=}'�$�M���H�ʙ�?�P�a�� $�@�TObusA����>X�Vy�.�:>�kBS���8�!��_N�8��\�Q��]r�����z�f �����A�"����(O Y��j���>�S��$Y��:3���JN�5��s-)(�ݜ�"m�&YC����f�9����TX�Y5���7�D�x-�⇒��BE�Rpr������q	BN L`�h dÁϣ2�ٶw���_R����5��lN���^�\��{Lr�V��Rs�2P֨e2B2t}ͮ�[YsK�4b���OKA�x�����7B{J�\U���3�i�X��� �z����҄�����4lV�ۅ4�l.֐tFӍbR�^�JwD=�iƛ=~��6
�ӓ�U��/T-UXQ�ֶ`+��⯜0��we��8��Aɘ�L�B���4Ȟ�da���q�������PI;�����{�J��6�;r2Q�/�C�@�~�@*l�#E�C�aޜk7�X�_6n������.9��F��sk���d���Y�J����a�:���5;�I0�	�z_�T{֟����_
�5�[��'�~-��#[ｋY�x�P�)՜�f�\����n�z���2�+9���� ����\Y URI���m��%�,�V�|K��(��aŽT��{��TY��������A�h��,�# ����.* m��0o;��f\�q�$US��� s0�+I<�V�6�)>������y�\S�������]���,a
���n�ީ��I3���nXo��ۭ��r�WӤ٨W����ģX���1?�<~�=�+�@����{���� ����ht]����te�'��أ�D�����f����V���Ͳm<���@�&�u=�u�u���m���l�G/\�iA�@�C���@J ��W���Td�n������V�Q�}a�=j��60��`n=pe�cC�S��*�[�;����r}��G�נ�M�Ñ ����Gɞs��pLb�wҽ��")�m>�1K��ǥ3뀗�C���:N=\�:�7p��Bo�.?��#.�`�q��D�&��-Њ{L�<�.4a��0?�EJ��0�8c�����m�X�(@4u1�y�G�.r���a)����A��щط�C�i<���&� ����D��n%�;a��LzA���v��l3�Qy���`��_.�>�:��H����������r}o�up�À������s��Z��j����ʶ���-��g�͉@����) j�v?6���*vɺ���k����*�A��?��z�X岓��Q�#�j\I�z3m��J�6�q��l��f��#��F���i�,7�a��I����٭6#�C��h��e�ρ/�o��吟��$�$S)�J�<G�(>� 57��lo7(ηT�qm�Z����u��~@V�S�N��k���(Z.�YN)����G�1�g3��n5���9�����!Dђk(@ ��ۮ<&�P�28V��OW��Q�p���S��!��Xq�����2� 3tߙL�݁r���&Jğ�*��w�Z��dp����=2'���iᄰ�C(a�R�A��;k�5�r�ċ�F�ѾP�z�5wf^�0k���H�!?oy�N�������DW��0����Su8k*n�Wr� s�w��^^!۾�p;������V�/5z����Vf[a��߆�7LK3��)���[�#V�4K�#�j�*U�bԼ�ݸ٫�=�y�i�_k���j����J��6k�&� �G��qō��zA�m�����ʝ:u�H_-����W�q��ڙ!F�Ǽ��0�_˸�n��/��sf�n[5��q�锎��h`�l��?f4�J(<׶��#/d��;�%�)E�����^V
}&���2�,k`��5�K�#+�D����p8�U�Z!t���%�|��fv抯����m��c������n��U��E�4�I��4��>ni4������3w��'�`/�#'��2q��l�d���m�Y�H˿�2��<��n{4�"I1�ը���8�������s�ЂNi�M���!���!�����յR���jeqxq�B���dS�R���O�FCCi�I�}���\��S7Ç4u�gFR!�g�.�͓��PY�kl��o�{�>�W�++k�:_;��Ur�؏�ܵKn�:2���$Z>7{A�^ۭ���n#-�e��+I9lG�VW�N/n�B�';���q4H�ͷ���a� ��W��A��`2��ܨi����#`���zd&IR� �U:��?��z�¨����{�d�g����}��� t��$L�O*�d�H�ʖ<��9C�޲����M%ߤ'̗��T��r�8k�D��^'�����| '�{�E��wg%������5�c�3x����T������&_��nG�s��G`�=�,���h-�e���f��u=�4#�S�O�������eЃ�o��	��J�+"�A:�}:�����83�ɦ	s����'���ID2b2�8��3��f'�;�`�\�lPF�$�܉���.��=�'���˰�fe3��&���ʨ|��Zq��b�l
�:9Z�UHy�w��r�׉Ұ�NӰުW�N�(��^�ތzU���D�
�&3���lk������:O��3-j	    [xG��q?���E���G�I�Ɨ��'�s8�����W�����k�դ꓃t��N��r�W�-SC�}k��퇥���/��"�'�g3�Ed��U�a|���%���lRF��{���z[ʢڤ�Fç��i|��֪z�ǒ���B~� ^!��oos�2�C��B���&DHb�?5��q�ba�"�X*�*����cr]���D��N�О�c���4?����������2��PI>��~e06@��q<���O ��E��	�x|�M�{��!��jr�Ϛ�q4	U}/�lF��L���F��p ���k%�+����d\CMi�:[�]]�9�PF���K����W��m2��]���GN;hiI�+C�ػJ�_(����{c��j���Z�^#�w:հ��V�j#��:�f�ӌv8 ��n^��d��Wgyu�}����̠^��~����uz�k���zr�-k�X��CO�û�4(_IA��}j$��|��䤯�nQpR�G�6x׫�XR�ƤC�B�O%�uHn����<�#}�~{�K˛.��N�]m>�-Â����!�!���S��%� �M��(�$�*a٥�>L2�+g��=PD��{/|ɜ'�,Q�yFw=E�C��R������A��Ɗs�`P6,`�]���������K-�?r;��ek��p�u�9�����M�����t�S�o��ףAW�ב�fW��Q�	q�U�K'|��ے�S��� fglx����99�MUҶ��(�܉2vS�� ����+c�^��W�P��KxA��ߑ\�ZTԪ�ݴ7[�r%l�u�Ui-�6�zXi�ŷە����|e������T]UH��i��8S;��P���k�⟱,d��/g#��e�s���4l�S!���ӥ���@����$�(��1���~���/7�0����<e3ϲ�)v�g{Bƹ&F�]�x+�C�N	�ك��;���Y,�п ��(	eaR}��;G Y<�F�x�#J;�An}�ݟL�S��uWw��tM�J�L���,*&֎,ͅW>��-���t�w��}����+��i�S]�}�y�[A@u��,�AW4�c�|MĔ ���X`���0H��X��V�w=�ifN5N�f�^�*_�|h���s�g+�F�%Z�TDʵ+��z.
����y0q�ݛ�+���޾��(�RL�����܉2��C9�t:�b�̠<F�N�/�9����u�X���'�*p�B����B��	��i��ހ�7TK��wz������<��z����R�7]���7��n{nG0�A���l�c��q3ֿtG�:ó�a��g�/Y��8࢐��n�kDI����p��q�F-(׋{�F�������l�N�ɆCߔ�^�w۝�ւ�sb�r6~Z�ZS�}"m��Lڞ*�Ȭx/��	�V�5�ˈH{d�9�8P�$���O�=�Z����3����� +Xm�z�ap���v�_��g��ou�=Z#{���k]����ɭs��T���R��-|��l���2t �PvS,8�=za�z�7���M��%B�״k�yN�uwd�{Yڭr���a~g�����I0�?Mi�"�8�1�[$"yj�{gP�v^�� ���T��ل�3�[�R:��HQ��ʇC�8�l��
�A�/9}�y��EH� ��Kc�րp��\#�ת1�f��"���r�$t�xC#}��͇�/��6�n�\n�¤Vk	�'a�"&�F�^���^�#xz�����6���d�ʮ5 X���Q�rȫk\�������ђ�����!��)<"U<�a�y}���9��9�-�>l���{jX�
!|��V3�2��#��%8�GS�B��D*���*�n��!t��J#~WV�h����إ�|��K�_.0�ž;kˏ���_<�b{HV�
�B�'�ƀ�����It:!�G�Il���cw���xjh�ھ+��'�Ɣ�;h����ϧDA|W��0]�m,[���E���&�F(��C�	~����L]p�C��e��%%d ��,)D��ze.��s��b�7M���~�SMkbu熩���O�(��!j5NY*�h/��v�~�W��^D�G�y�4ZH�!�r��k9�őR��Ǭ�f��}����!�J�z��^���R=)�c&�n��ou�������F7�M�\��O�c/i��j
�c1:��΄A���/;�R��F|_`wG0y�Heʹ+y�GDꂯu�Y�ʽ��p=��hs�� ��\ٝ�$�pn��6���	TU�Z~+o�9p�	O��az��'��x_i}�V��:���#�?qH�#���R�t��(���=�O�"��K"_YY��#�mW6�G(��(D@Ez�g}tsJAߦ��h��I����$8MyX�½gw�Н���d�&!�#ٽp$L���v�7Y&�ET��D+#d�%�c̒$�
��a�x��c �a�@��I�
e�'2|��1	��#CؠWn�����zwoG��;`��-�1<j�>�vvN,���,ka	H"�UK�e����nJ�m�1ٮɜ"���f��S���k?��_,y��C��{;�v/�z�8l��vX�t�a7�6�Z�h���F�W�v*�QT���z���NX_	;�j+�Q�����N�@��֤��[��
8��J�s���V�^�?��@u3�֐�yet�1;
�İ�����4�+l{%�U�p��L�#�]�RbZ`���c�/�\� |W��A�'?��X�prBV�+�%7:C�@���.��'��+�8<j6x���nٮ	����H�HQD�l��/�U� ���h(OE��M�iT������h��#����o����{K�b�Ou�-��`��G��N��D�m=�|,�#9�4� ���؛rb�� �����ֹu
yk4����c���T��>I�r��P~I�)�L�q+�l�#g�R/�za��J�z��_k7�r�ZO�(N�Neg���{��	����`����U�m�m`�~+~�!��vG+iAh2��� �5=Nݵ����!-�Q2	��{z⺥F�f���.�z>�.z��z���A�<���4�����As��`��XY���k����V������t|N�ׂ��g-#���o����L�� ���i�"��`��o�2�m�Ru�9Ŷ�ܢd��,إ�+k�Ej h~��N�Jo
sAU��H�6�! ]�p�zE�8D_��O�u�����_I�����bɊ��^Ȝ�ZR�(���34"��0�	�c�	�$jfl	�
dn6�y�8�a���1�`n�{4�1D�C��4H������hps��O�@#&0D
�#��ve�^`2�ё�+ފL	4
U��u8B �t�����ݸ���n���{�Kh��^���v�����$�^���wN��LP�X:���,��W2J_�Ft޴��~�,�^�]R=Ж�m�>|5X�M�2���θ��c�jh>ラ��go@e���\jJ<p1�&6}��K}2lӼX����4�R��|VBܭ�w�A�n�Q��R˗��NN�!��i��l��R�������.���U^�9�	�!һ=DCJ����q�k%�7�V{�/��U�^�!�F�A�/tb�{��;^�rT����tH�*��G(��J����Z��Gf�3�6�
�KL�<Z8��
na��`p�Se�	��=�G.�>�v�^ҫ�Q'lE�rX�հӪ�a��l�z�n��Iv�Me{K38����S���tX�4�%X���`3�ip F�ϭ|����5��Qb�>;���?Zd��(��^��X��vC���%#��'�H)g��:���9���'t�/w��?p�fߜ/���E�'o<O�����U�l���ЖH�G�xp�PM{���Yv�;ckD�S��~�O��	��G�;�w�<�H��i����%o� ;d���a��[�n� Y��Wh����<O�U�_XM���6��	;n�Y�c�e<P�3(�n�
�_H[��S ��P��ٕJ}�\+��Jv�FXoV�a�ݭ��J�މI�u�� �  �0ba��WC���OU&�K1���Rf/����+_8��;v�$�� 5z]+Y�B%Ѫ@�ɩ��z��?*�TM/�_�l��-�Ek(�O�(����i4�G���L��0�Q��=I��jp"e��ю��9����
�"YQ�5���ؽ�I{�r4���9`U�g��<br����M���i0��Oө�2<���F#0 � 1_�v���}��������h�/.q���a�l(�nb�y�d4�!4���2���^��MNS؟��G��"��� F�關c�X��L8��EW8�"�Y�JA�兾GQz����"2A#q��G���P�[0�Z0�s%�����?���q�L����f��,W�ͰR�P�Ѯ��Z�F�V����Z��d�v7M�V3L�jX��u�l_�z�\/ך�j7�(�S�g�g��AA�t�gie��W)�_l�-���ѨŴѩo�f[�u<ݯ�d+oJ�G�yU�:R�����ܫ}�d��$#��ۆ�����I?��7����~[3v��El9��6�h��n���t��'��)HUuNz%'�ԓw|��݂�A�j��h����8M�'��j ����Pd�NQ�\Uq\�K�O�e��\H8;R���	E�U%��!^�	C
�O�K�E<j\���l��+�:�N�{���f`�+��� z�s�E�3n����|��Y�����E������޾�a/H<���f��� k0V��|�xOG5��4�ՙ��02�!�[-�`&S�� mSH�Twk�^�҂�\�)|.(��&�vwʝ�w�����sG�a䔹�_'��GL	�����[j�o�
P�LPà���Ͳ^Tp�B!:�1��zG�7L{�6�-��~�.�\��0?F���,v����s�ѭ[D����T4Q�~B����T��G���=�����{о�R���r�l$�a�:�`{̄��c��*^˜��^x�Z��y2Ma�I:������� Ȝ�����a�G�pZ�+X,ǐ�[Y��L�%��|.�#��}yQ��x�{��o�DB �%)v)��.W Y�.y)�2Uu-yb���[ �܂j��#xa�� �j����#�h�ǐ�J%	���ᔚ���	�v��'�-Bz[uV&�'1߫yv�y tx���k҃j�ў�
��)����cB;�^s4�a��j���BA���)���gE�m�SX�ݿ�������      '   b  x���Kn$9D��S�~�)J�Xg����	����1�a{��Ԣ *S/##B���g�*ި�>���ȝggoW9��쓶kP���/w*�r��m����9ʅVߊEʔ�'���J���E���~H��z/�����/��N��;�~���Qk2�=z��]i�wܥ�ey���Zv�.��\�c��+C���}�ES���qn�*���v��t�ź��"��U��T���ޚ�:%pqj��M\��~�����p.�Pw&u�94y���%�!d7�i��L��P��� ����^�Tn��<>⾛���?_��%���.G�(�S�m�6������U8Fۢ����Z��^�����œ��#-��b������Sαs�9��d���&e̅E}�#���%�~/������}N������=iOF��`�����P8�^��-ނEgR��ri��{Xk�\��Kܔ٢|�}7}:כJ���� �B���"�4^�Ǯ�2;��A�I�פ��m����`�7<�?Vx3d�'�>\�+z@@��tg����lR��M�-���mS�,6�ǥ�?���M�p����ky&O�����Q�(�ؙ�1��Pu��^��}Sԩ��#"�i�wp�?:��P�ٹ}�De"X��*Ԃ���S*7��ƥ5�m�8�r\⒳�e�ʟ�ho����v*�^xඦc�آ��A7l��~�X���,�p"��;����^�X$�+�^�������?D�U��7���B/�}�!��f4��k$�q��SxO���j���D����#��;%�]>�5���ħ������k[�ͅ��t����gT,�c���$�I�>տ�u��|&����^^^�"�=R      (   !  x��\�o��N����Z@�DJ��<n�`IW��S�����ȤKQI�A�?�9�SXڧn�L��X�e�_ ���s�D�Ö�Ql�2//�=�w�~��iŨ�B�+V�(+E��)F�.)�Z��U�h�굼��eX��Wt�h�(�t�T�����tS����'������1��%�]�;��u��,��6o����ޒo��.�l��L6����q���s-�l�ޗ�*.�
�����O�dn\����a�\���߅�e\�-�kk�[����n�b8oܶ37ʚ��JjE�fP#�,�PՒ�;�F��͌��f\�����WA�F�[~�u��/�ý����N����v�����{�J��˯��cX������0{�b�����h�����y[d���%��ת���W��R�Wm�WJj��U�d�5��Z�����J�\�+�U1��^��jI�;��y�w�#-����#e�i��]Hn;�"t�u��o>pݪ7}�[��,
�x���%`�d7�Ɩ,>yl4Zh��W�c�]3���s��&l끪�5���D�\j�����$��]�i*��E��*�i*���4j몙/��B���{e0��[��0ݖß�����(p7�W�t����<H΅k����M0���I�típ3<Ȳ��G�1<�{,�	����
�L>���@�����s����g0}#��p�c�P,y�a����� ��K�g@��,����pw�{���V]�c�o?��X�f�L��nx�:���7G9P����
KvQ�.L)@Q�߅��Z'����n���$�|8�_�w��G�m��q�hn��7�|0ʽ��غ��m���\�� �6A�N����]Dic��?c
C���p�t�;����Q+Z`B��}&{���]0��\!7�1�eKk�ҋ{*ꂠ�hV���� f�S>��» ,` �1�����J��!{�� ��R~�3_�o]�*�P��"_����Rx��3�M� �=f
�pf��#��7g7lL3��C��}W$ 
���}��wx�>_\�2�Q����d�2I����S
��`𐿜�{�>� �bb������9	F�825��Q�cx��z�G�� Գ�D�Mp�^��D����d(!.�9`
ڂ��N�� ��l��א/<��F��X��弡*�i M�qK����ٚ�/W��Jɚ|����Y�-(����/�Q���O��:�#��5Cg��R���`�-̒�U�V�棒�G��Г��O���~\���kE�V��m8}ꕂb���R2��Z3�^����_o�e���k�K�r�E�?TXe���+�zY�{
�D�>�M�ن���b3
*���"D`'|��F���R�B� ����>��7$�!�v 	�{!�G��p����QXB�@AbwPҬ��Rc�'�)8y�xD�㰀�P�!y�r�S���OX�x�1��Y}u��|��e^�	�:�LHyR:2��QzE#t��QI|��R9��?ѤM�w$8(pp!�bQi�m �l�I��G�;�"X�E.��Pjdm[@�������$���W�2����Q��� ��#CFUd���5����h	�&�*E䕲|���wѷ�1r����CT:mx�	'���/<Z��u�<��x��&�h�ٙ6[����?G�- 9������I�b�h�^vP���L(kt�	���iFS�+�1ϋ�6�G�q�!��1�O��
�8�Hoc�x�1���y����y��=��Zu�3kŀ��<&[�N��J�)@�ȡ����!�n�!K�d�k�g(���1��é �낳!��H\�GQ1 q|CVJI���8�6	���E���*+b�x&J,0;�)_8�.�.Q\(��#��(�EI{xQ-C�6���qu���N�@��XG �O��i�])j���Rm`\��]�
�^*XzQ��h���̢��w����4�Ў����@�k}XX(Vռn늡�&6<-���5�Ҹ���*O�@��̭a�����.R�`d"�bnM���(��͚XKD��)��t���a�a8�u]y�B�C~9y���ާ��� �{���q
^�=:��`���r��c!��M4�:�G���=ڧGDq�JD4#�z�5��[��[�%\ �h�g>7, 	���=���⺍1��zB\���g�t�%�����sQ���g���C��H����	��XM"RC�kQ��!n��C}:�|$_��Y�LY����j���ܵV��*[�ϗ��Q���&�"'��� �u(�6�T6�: .����v@TJ�%������;$�K�y a�Љ�$�Pb���|�"�uް,|�q�3��?`�$ Ӗh�&��C�Ɉ��E$,� �D%���2��$
s�eB����v�^����>�g�
�w٩�xdh��=jF����FX�J�L��!:�+q�����.�8{EV?���,�=q�&���Q�(�Ǐs�qB>�4�o�`�s\q����x%Ʌ؝K��̊7�2
z'R�PR��`OK��\j:+�ГΨ�����0j�`v�|�2�D��r	��+"4Q�b}���A��0C^��-�C����ΕOJWߝ��]�2}c���L�X�o,�7�������ުJ_X�/,�����e��2}a���L;@���|ئ���^��_�������FQ�(JEi�(m����Q��E����^MګI{5i�&�դ���W��j�^��ռ"�~ߝ~ߝ~ߝ~ߝ~���w�u�����������=ƨ���
��������ׯ��p�S      &   k   x��K�0�5��Q�	w��^b�(UKX����m�Ʊ��7\[��S��F� f¥筿���6ن�H%qh����� ����	c���[?���㋣}_�{�k&�?��"�      #   w   x�eϻ1�:���w	�	�{Jq���Q E&rZ�l'�I����l���M��}C%'�9�0=i�Q�|�/�K�Fw�$�O�u�vw,t�.���U����\��w�w�1��;     