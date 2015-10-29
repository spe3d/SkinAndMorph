#Skin and Morph

In our avatar model, we use morph for facial expression and bones/skin for avatar movement.

However once we import them into SceneKit in Xcode, only one will be shown.

We suspect it's a tool's problem. The many opage end from 3dsMax to Collada to SceneKit.

Now we use Blender to review the result but blender seems to be broken. 

https://developer.blender.org/T42197
Collada import and export wrongly handle skin morphs.

This is Collada's specification on [Skin and Morph](https://www.khronos.org/collada/wiki/Skin_and_morph).

`skin_and_morph_example.dae` tested by Ray in 3dsMax 2012 and worked. The only catch is that they cannot export animation keys along the way.

#Result

In this sample program, you can load two skin and morph from two file format, SCN and DAE. It works out the DAE provides morph and bones correctly which SCN only gets bones working.
