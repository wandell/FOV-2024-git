---
id: 7
title: 'Chapter 1: Preface'
date: '2012-02-08T21:03:53-08:00'
author: Wandell
layout: page
guid: 'http://www.stanford.edu/group/vista/cgi-bin/FOV/?page_id=7'
footnotes:
    - ''
---
# Preface {.unnumbered}

- [Preface {.unnumbered}](#preface-unnumbered)
  - [Encoding](#encoding)
  - [Representation](#representation)
  - [Interpretation](#interpretation)
  - [Selection of Topics: Methods](#selection-of-topics-methods)
  - [Selection of Topics: Problems](#selection-of-topics-problems)
  - [The Principles of Vision.](#the-principles-of-vision)

While writing the first edition of this book, I was inspired by the breadth and vibrancy of vision science, writing: “Vision scientists solve problems across the fields of biology, psychology, and engineering. Our field takes on problems ranging from the nature of consciousness to the hurry-up-and-ship-it applications needed to keep a company afloat. The book is filled with measurements and facts; but, my main goal in writing this book has been to explain how we learned these facts and how they support a collection of theories that explain what we see.” I remain inspired.

In the thirty years since I wrote the first edition of this book, scientists have built new instruments and made new measurements that extend our basic knowledge of the visual system. Magnetic resonance imaging, adaptive optics, and optical imaging methods have extended the foundations of our field. New theoretical methods have been added to the computational toolkit. I am glad to have the good fortune to be able to update the text with these new ideas and methods and to write this 2<sup>nd</sup> edition.

The technologies for book-writing and communicating ideas have changed markedly over the past thirty years. The first edition, written prior to the widespread adoption of Internet technologies, was a conventional printed volume. Over the years, I migrated the book to a web-site and made it freely available. These days my students learn nearly exclusively by reading material in electronic formats (web pages, e-readers), watching videos, and interacting with computational notebooks. For this reason, the 2<sup>nd</sup> edition communicates vision science using these newer formats, with an Internet-first approach. The links on the book pages lead the reader to additional explanatory text, videos, and open-source, freely available software so that the reader can explore computational ideas.

A few portions of this book are written with the expectation that the reader has some experience with mathematics, principally linear algebra. The main thread of this book, however, describes the measurements and ideas using only a few mathematical symbols and visualizations. In those cases when I think the reader might benefit by learning about a deeper mathematical formulation or computation, I have placed the material in a link from the main thread, and generally I include links to introductory explanations available on the Internet.

As in the first edition, the material is divided into three sections that form the foundations of vision science: encoding, representation, and interpretation.<a name="Encoding"></a>

## Encoding

The first section of this book describes how the light arriving at the eye is converted to a retinal image, and how this image is encoded in the retina and early visual pathways. This edition incorporates more information about the physics of the light from the scene and how the physiological optics transforms the scene light into a retinal image. I add many links to new computational tools that simulate the retinal image and how that image is transduced by the photoreceptors. The material in this section is particularly important for three reasons.

First, how the visual system encodes light has implications for everything else the visual pathways do. Distortions that are introduced into the signal by poor optics, sparse and uneven spatial sampling of the image, or meager wavelength encoding are part of the signal that the brain must interpret and that becomes our visual experience. We can’t understand how the central nervous system creates a visual experience without understanding the encoded information.

Second, the properties of the visual encoding have implications for the design of instruments that display visual information. The images produced by display media must be structured to satisfy, but not exceed, the limits of the human visual system. For example, the industry of color imaging, including visual displays, film, and color printing, relies on the fact that human color vision uses three types of cone photopigments to encode light. As a result of this sparse representation of wavelength, color reproductions need not represent the wavelength composition of the original in order to provide a satisfactory appearance match. This is but one example of many in which the initial encoding of the image in the human eye defines practical limits whose properties determine the character of imaging devices.

Third, the methods and standards of proof that are used to understand image encoding are a relatively mature; they set a standard for the explanation we aim to achieve at all levels of vision science. Defining methods and standards of proof is particularly important for the interdisciplinary field of vision science, which draws on expertise from many different areas. The Encoding section contains examples that combine physical calculations, biological experiments, and behavioral studies. By explaining how these fields come together, say (a) when we measure the quality of the retinal image formed by the optics of the eye, or (b) when we establish that human color vision is trichromatic, we learn how diverse fields can forge links that rigorously define important aspects of visual function. We learn important facts from these examples, and we also learn about the highest standards for explanation.

## Representation

The second section of this volume reviews how the retinal image is represented by the neural response within the peripheral visual pathways. This section begins with a review of the anatomical and functional measurements of the image within the retina and primary visual cortex. These measurements characterize the neural substrate of the visual representation. These studies reveal several important points about how light is represented in the brain.

- The visual system comprises spatially interleaved neuronal types, with distinct anatomical and functional properties.
- The different neuron types form circuits that receive and transmit information spanning many brain locations.
- Different types of visual judgments can rely on information represented in different circuits.

The second half of the Representation section reviews perceptual and computational studies of image representation. These studies have led to various proposals about how pattern and color information is represented within the retina and early cortical areas, and how information is integrated across a series of eye movements. The computational investigations cover fundamental issues, such as efficient image representation and quantification of the information available for visual interpretation.

## Interpretation

The encoded retinal image is an incomplete description of the light field that arrives at the eye. The perceptual representations that follow the encoding extract conceptual information about the scene, such as object segmentation, shape and size or material properties such as surface reflectance, gloss and texture. Because the visual system encodes incomplete information, often the visual circuitry cannot make rigorous deductions. In general, the circuitry must make inferences about the most likely properties of the scene. For this reason, we say that perception is an interpretation of the scene, not a rigorous deduction about the scene. The third section of this book contains models of how the neural circuitry might interpret the retinal image to assign perceptual properties such as color, motion, and shape to objects.

When we use algorithms to interpret image data from cameras in order to infer the color, motion and shape of objects, we confront the same challenges as the visual pathways. The study of these computational problems has made it clear that the visual system succeeds in interpreting images because of statistical regularities present in the visual environment and hence in the retinal image. The recent success in training neural networks to identify objects and shapes – typically from labeled image data – reinforces the principle that these regularities provide critical information. These regularities permit biological visual systems to use the imperfect information present in the retinal image to draw accurate inferences about the physical properties of the image. For example, when we make inferences from the retinal image, the knowledge that we live in a three-dimensional world is essential to the correct interpretation of the image. Similarly, the principle that a scene comprises light sources and objects that reflect light is deeply embedded in our neural circuitry. We are made aware of the existence of these powerful interpretations and their assumptions when they are in error, that is, when we discover a visual illusion.

## Selection of Topics: Methods

Certain theoretical and empirical methods appear repeatedly within vision science. The most important technical method, which appears across all areas of vision science, is linear systems theory. Whether characterizing optics, neurophysiology, color vision, spatial vision, image compression, or pattern analysis, linear systems play an important role. There is little possibility of understanding the foundations of vision science without understanding linear systems. I introduce the principles of linear systems in the first chapter and I refer to them throughout the book.

Linear systems methods consist of a set of experiments and mathematical tools that one can use to analyze a system. If the system’s performance satisfies certain experimental properties, such as the principle of superposition, then we can use the mathematics of linear systems to characterize the system performance completely. Even if the system turns out to be nonlinear, it is useful to begin studying the system using summation experiments to obtain some insights as to the nature of the nonlinearities.

A linear characterization of a system is rarely a satisfactory scientific account of the system. The characterization is a phenomenological model that is very useful for predicting the system responses. Many questions often remain about the system mechanisms and these require explanation before the vision scientist is done. This will be evident in the first section on image encoding. Optical image formation, photoreceptor sampling and color matching are all fundamentally linear and thus we can characterize the performance of these system components. Even when this work is done, the vision scientist seeks to explain the measurements in terms of the elements (cornea, lens, photopigments), and how their properties impact visual perception. Knowledge of these elements enables us to diagnose disease and intervene with clinical solutions.

In part, the emphasis on linear systems methods is my choice; but, this emphasis is inevitable because of a second choice I made in selecting the material. I have tried to include important problems that vision science has solved, or that I think are close to being solved. At present linear methods are much better understood than nonlinear methods. Consequently, we understand those problems which yield to linear analysis much better than we understand nonlinear problems.

While linear analyses tools are the most successful and widespread in vision science, even thirty years ago there were important examples of successful nonlinear analyses. The first example is the analysis of the relationship between color matching and the cone photocurrent treatment in [Chapter 4](/chapter-4-wavelength-encoding/). This system consists of an initial linear encoding followed by a fixed non-linearity. These types of nonlinear systems can also be treated very thoroughly. The review of pattern sensitivity, in [Chapter 7](/chapter-7-pattern-sensitivity/), also includes models that begin with linear encodings followed by a nonlinear stage. In the appendix to [Chapter 7](/chapter-7-pattern-sensitivity/) I treat the profoundly nonlinear act of classification.

In the years since the first edition, there has been an enormous growth in the use of large nonlinear systems. These computational tools, also called neural networks, have had a massive impact on the engineering community where they are used to build very impressive and useful tools. They are increasingly being used to reason model performance of visual system components, and it is my guess that such models will be important to vision scientists for many years. Thus, I have added material to this book describing the principles and a few applications.<a name="Problems"></a>

## Selection of Topics: Problems

As I selected problems to review, I did not distinguish strongly between those that are called basic from those that are called applied. I share Edwin Land’s frustration with this distinction. After a theoretical lecture on color appearance, Land, who was both a brilliant inventor and entrepreneur, was asked to explain what applied problem his work would solve and he replied quickly that the work had a wonderful application. He then paused while the audience leaned forward to decide whether to invest in Polaroid stock. If the theory is right, Land whispered confidentially, we’ll finally understand what we are doing.

Vision science finds applications in at least three important areas that I will draw on throughout the book. The first area is medicine. If we are to help the blind, we must understand how the visual portion of the brain functions, including the anatomy and functional properties of nerve cells. Equally important, we must understand how information is represented within the brain results in behavior. The results of behavioral experiments can answer questions about the organization of information within the visual pathways that are inaccessible to the anatomist or the electrophysiologist. Together, these results can guide the development of medical diagnostic tools and prosthetic devices. Tom Cornsweet’s beautiful book, Visual Perception, was a guide to most of my generation as we first learned about the systematic analysis of the visual pathways, ranging from the visual pathways to behavior. In this book I hope to explain to the new student why so many of us found Cornsweet’s presentation exhilirating and to build on Cornsweet’s review.

A second area of application is the design of computer algorithms capable of analyzing information in an image. Typical applications range from part inspections in a factory to the identification of a tumor in a medical image. At the time of the first edition it was David Marr’s book, *Vision*, that stimulated the interest of many young scientists in this area. He presented a bold overview that related biological concepts and computer algorithms of visual processing. Today, the computational approach advocated by Marr has been augmented, and in many cases completely displaced, by the use of nonlinear networks that are trained on a large corpus of data. The contrast between the large-scale engineering networks, which are phenomenological, and the analyses by Cornsweet, which are mechanistic, reflects the creative tension that arises when different very different disciplines contribute to a broad scientific endeavor.

The third area of application is the design of visual display devices to communicate information to the human visual system. When two electronic components communicate, the components must be designed to accommodate a set of communication protocols. In the case of communication between an electronic display medium, (e.g. a television display or head-mounted goggles) and the human visual system, the designer can only re-design one of the two components. To communicate information efficiently between the electronic system and the human visual system, we must build displays that are matched to human capabilities. A remarkable harmony between vision science and applications technology has been achieved in some areas, such as color science. I hope that this book will contribute to the further coordination of our basic understanding of vision and the design of useful and efficient visual displays.<a name="Principles"></a>

## The Principles of Vision.

Proposing an overview of how vision works can be a lot of fun. This is particularly so when the author takes a chance, as David Marr did, and suggests a broad framework for thinking about the visual pathways. Marr’s speculations about zero-crossings, the primal sketch, the 21/2D sketch, and so forth, gave the reader a framework to organize the many facets of computational vision science. The Felleman and Van Essen catalog describing the cortical processing stages is another organizing principle for cortical neuroscience.

There is an alternative view of vision science that is predicated on the principle that the components of the visual system used to performance different various tasks are quite different. On this view, a single diagram of the visual computations, in which zero-crossings are inexorably followed by a primal sketch, and so forth, with all the components play the same role across tasks, does not capture the flexibility and adaptability of the visual pathways. Similarly, different visual tasks may be limited by completely distinct neural components of the visual pathways, either different neuronal types or different pathways through the cortex. On this view, there is no overview of all of vision; each task calls forth its own calculations and mechanisms.

Even though a static diagram of visual processing does not suit me, there are several general principles that I found useful as I wrote and organized this volume. Some of these principles are embedded in the organization of the book, repeated in the introductions to the three sections, and repeated within the chapters themselves. This is the time, however, to introduce you to the principles, briefly, in one place.

**The Inescapable Components of Image Encoding.** The properties of image encoding, such as the blurring by the lens, receptor sampling, and trichromacy, shape the information available to the rest of the nervous system. The properties of image formation set limits on what the rest of the nervous system must confront. The importance of these limits for visual perception and for the organization of cortex is the reason that the first third of the book is devoted to describing these aspects of vision.

As we shall see, the image encoding is a very partial description of the light incident at the eye: There is only a narrow region of high visual acuity in the fovea; the dynamic range of the sensors is very small; the representation of wavelength is very coarse. Each of these features has consequences, such as the importance of eye movements, or the necessity of gain control (adaptation), and cortical processing. A camera with such poor optics and coarse spatial sampling would never succeed in the market place. Yet, the visual algorithms of the brain can interpret the properties of objects despite this poor encoding.

Whether you wish to study the eye, or study algorithms embedded in the central nervous system, you will not go wrong by studying image encoding and thinking further about its implications for vision.

**Adaptation and flexibility.** The visual pathways compensate for the poor quality of the image encoding by their flexibility. Nearly all of the peripheral elements of the visual pathways adapt in response to the viewing conditions. The lens accomodates, the strength of the retinal signal varies as the mean illumination level varies, the eye moves to bring the high visual acuity portion of the retina into a favorable viewing position. The flexible responses of the visual system compensate for the mediocre image encoding.

The visual system’s adjustments to changes in the environment are fundamental to its design. We see adaptation in the form of gain control throughout the visual representation, not just in the peripheral components. The role of eye movements is central to the design, so that outside of controlled laboratory conditions it is impossible to characterize the visual system as a static device. The visual system responds to a changing environment, and the tools of this interaction begin at the earliest stages of the visual encoding and continue into central brain representations.

**Visual streams** As we review the visual representation of the image, we will find that the neural pathways are organized into several distinct pathways. These pathways, sometimes called visual streams, can be identified based on anatomical studies. Some cells have different shapes from others; some cells send their outputs this way and others send their outputs that way.

Many of the most important discoveries about vision concern the the identification of visual streams. Many of the important contemporary challenges in vision concern explanations of the functional significance of these streams. Segregation of visual information into these visual streams begins with the photoreceptors (rods and cones). Clarifications concerning the visual streams within the optic nerve have revolutionized our understanding of the visual representation. Understanding the organization of visual information with respect to these visual streams is one of most hotly debated topics in modern visual neuroscience. Identifying new visual streams and understanding their function is an important challenge to vision scientists.

**Statistical inferences** To me, vision science is about how we see things. The interpretations of the image, or as Helmholtz called them, the unconscious inferences, are the purpose of vision. I study vision in order to understand the methods of interpreting images to objects and their properties.

The retinal image does not contain explicit information about objects and their properties, and there are multiple ways to interpret any given retinal image. The visual system’s success in interpreting images must be because it makes good assumptions about the likely properties of objects. For example, the visual system is committed to the principle that we exist in a three-dimensional world. Even when we view a flat display, we interpret the the image as representing a three-dimensional scene. Not all surface reflectance functions are equally likely; there are regularities in the wavelength properties of surfaces and illuminants. Not all types of motion are equally likely; hard objects cannot pass through one another. The unequal probabilities of different interpretations make it possible to make informed guesses about the color, motion, position and shape of objects. The probabilities of different events are sufficiently different so that the visual system frequently succeeds at correctly interpreting the image data. Understanding these regularities, and understanding how to use them to interpret the retinal image, is central to vision science.

My devotion to image encoding and representation, the first two parts of this volume, flows from my conviction that we will not understand visual interpretations of the image without understanding encoding and representation. The encoding and representation define the environment in which image interpretation takes place. The encoding and representation must be structured to permit image interpretation to succeed. As you look through each section of this volume, you will find ideas about image interpretation. The material in this book will seem unified to you if you continue to ask how image encoding and the image representation serve the ultimate goal of image interpretation.