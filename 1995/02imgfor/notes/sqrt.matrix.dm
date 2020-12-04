From marimont@LLAMA.parc.xerox.com Thu Jan 17 15:50:09 1991
Return-Path: <marimont@LLAMA.parc.xerox.com>
Received: from kanga.parc.xerox.com by arisia.Xerox.COM with SMTP
	(5.61+/IDA-1.2.8/gandalf) id AA15542; Thu, 17 Jan 91 15:49:37 -0800
Received: from milo.parc.xerox.com by kanga.parc.xerox.com with SMTP
	(5.61+/IDA-1.2.8/gandalf) id AA07553; Thu, 17 Jan 91 15:49:28 PST
Date: Thu, 17 Jan 91 15:49 PST
From: David H. Marimont <marimont@parc.xerox.com>
Subject: Re: reference on matrices...
To: brian@white.stanford.edu
In-Reply-To: <91Jan17.133121pst.16471@alpha.xerox.com>
Message-Id: <19910117234910.7.MARIMONT@MILO.parc.xerox.com>
Status: R

I looked in a couple of places, and found Strang helpful, of all books.
Here's something that occurred to me when I was reading Strang.  I don't
know the complete answer to your question, but we can at least be sure
that finding the square root of A is reasonable in more cases than when
A is symmetric. Namely, if A is diagonalizable and positive semidefinite
(positive semidefinite if you want real matrices), i.e. can be written

A = S * D * S^{-1}, 

where D is diagonal (no negative entries), and S^{-1} is the inverse of
S, then letting

B =  S * D^{1/2} * S^{-1}

does the job.  Here D^{1/2} is the diagonal matrix with entries the
square root of those in D.

Other than Strang, the books I use a lot are Samelson, Golub and van
Loan, Gantmacher, Rao (a book on Statistics that has a good chapter on
linear algebra).  I've used Lancaster in the past also.

Hope this helps.

  Dave

