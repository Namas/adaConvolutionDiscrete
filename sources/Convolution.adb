------------------------------------------------------------
--
-- Author : Jonathan Aubert & Thierry Meister
-- Description : 
-- Ameliorations :
------------------------------------------------------------

with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Convolution is
   -------------------------------------------
   -----------D�claration Variables-----------
   -------------------------------------------

   
   
   package Math is new Ada.Numerics.Generic_Elementary_Functions(Float);
   USE Math;

   -------------------------------------------
   -----------Fonctions et proc�dures---------
   -------------------------------------------

   --contiendra les donn�es en niveau de gris d'une image
   --la premi�re dimmension d�crit le parcourt de haut en bas de l'image
   --la deuxi�me, le parcourt de gauche � droite
   --c�d: tab(0,0) = pixel en haut � gauche et tab(max,max) en bas � droite 
   type T_Image is array(Integer range <>, Integer range <>) of Integer;

   function convolutionDiscrete(t:T_Image) return T_Image is
      i:Integer:=0;
      k:Integer:=0;
      tabC:T_Image(t'range(1),t'range(2)):=(others=>(others=>0));
   begin -- convolutionDiscrete

      -- op�ration sur les quatres coins de l'image
      tabC(tabC'First(1),tabC'First(2)) = 2*t(t'First(1),t'First(2))-t(t'First(1)+1,t'First(2))-t(t'First(1),t'First(2)+1);
      tabC(tabC'Last(1),tabC'First(2)) = 2*t(t'Last(1),t'First(2))-t(t'Last(1)-1,t'First(2))-t(t'Last(1),t'First(2)+1);
      tabC(tabC'First(1),tabC'Last(2)) = 2*t(t'First(1),t'Last(2))-t(t'First(1)+1,t'Last(2))-t(t'First(1),t'Last(2)-1);
      tabC(tabC'Last(1),tabC'Last(2)) = 2*t(t'Last(1),t'Last(2))-t(t'Last(1)-1,t'Last(2))-t(t'Last(1),t'Last(2)-1);

      --sur la rang�e du haut et celle du bas
      for i in t'First(2)+1..t'Last(2)-1 loop
         tabC(tabC'First(1),i) = 3*t(t'First(1),i)-t(t'First(1)+1,i)-t(t'First(1),i+1)-t(t'First(1),i-1);
         tabC(tabC'Last(1),i) = 3*t(t'Last(1),i)-t(t'Last(1)-1,i)-t(t'Last(1),i+1)-t(t'Last(1),i-1);
      end loop;

      --sur la rang�e de droite et celle de gauche
      for i in t'First(1)+1..t'Last(1)-1 loop
         tabC(i,tabC'First(2))=3*t(i,t'First(2))-t(i,t'First(2)+1)-t(i+1,t'First(2))-t(i-1,t'First(2));
         tabC(i,tabC'Last(2))=3*t(i,t'Last(2))-t(i,t'Last(2)-1)-t(i+1,t'Last(2))-t(i-1,t'Last(2));
      end loop;

      --sur le centre de l'image
      for i in t'First(1)+1..t'Last(1)-1 loop
         for k in t'First(2)+1..t'Last(2)-1 loop
            tabC(i,k)=4*t(i,k)-t(i,k+1)-t(i,k-1)-t(i+1,k)-t(i-1,k);
         end loop;
      end loop;
   end convolutionDiscrete;
  


------------------------------------------------------------
-- START OF MAIN PROGRAM
------------------------------------------------------------


BEGIN   --Convolution



END Convolution;


