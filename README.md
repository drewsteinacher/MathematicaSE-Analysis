# MathematicaSE-Analysis
A data science project to analyze [mathematica.stackexchange.com](https://mathematica.stackexchange.com) in a [Wolfram Language](https://www.wolfram.com/language/) [EntityStore](https://reference.wolfram.com/language/ref/EntityStore.html)

## Requirements
A version 12 or newer [Wolfram Engine](https://www.wolfram.com/products/) product.

## Getting Started
I've listed the rough steps I took here in order if you're interested in the details of how I processed the data.
But you may want to save yourself some time and effort by skipping to the exploration section and downloading the cleaned and processed store.

### Generating an EntityStore from XML snapshots
The latest XML snapshots of mathematica.stackexchange.com can be found [here](https://archive.org/download/stackexchange/mathematica.stackexchange.com.7z) on [archive.org](https://archive.org/), along with the other [StackExchange network archives](https://archive.org/details/stackexchange).
Code and directions for converting these into a [Wolfram Language](https://www.wolfram.com/language/) [EntityStore](https://reference.wolfram.com/language/ref/EntityStore.html) are currently TBD as the conversion utility is made public-ready.
But for now, you can download an MX file of a converted EntityStore [here](https://www.wolframcloud.com/obj/andrews/StackExchange2EntityStore/mathematica.stackexchange.com.mx) (~923 MB).

### Gathering site-specific metadata
Follow along with the code in GatherMetadata.nb to collect wolfram language code blocks and snippets, and align them to [Wolfram Language symbol entities](https://reference.wolfram.com/language/ref/entity/WolframLanguageSymbol.html) for fast and easy exploration.

### Exploration
There is a lot of interesting data to explore and extract, but I've done some work on things I found interesting in Explore.nb.
I've uploaded a [public version of this notebook](https://www.wolframcloud.com/obj/andrews/Published/MathematicaSEAnalysis-Explore.nb) for easy viewing on the [Wolfram Cloud](https://www.wolframcloud.com/).

If you'd like to do some exploration on your own, you can download a compressed MX file of the processed EntityStore [here](https://www.wolframcloud.com/obj/user-6a5e82a9-068b-4620-a269-0974427cc934/StackExchange2EntityStore/mathematica.stackexchange.com_WithMetadata.mx.zip) (~468 MB).
 
After extracting the MX file, you should be able to follow along with the code in Explore.nb and go from there.
