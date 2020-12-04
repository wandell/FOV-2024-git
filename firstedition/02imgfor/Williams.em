From david@cvs.rochester.edu Mon Sep 28 13:10:16 1998
X-VM-v5-Data: ([nil nil nil t nil nil nil nil nil]
	["1007" "Mon" "28" "September" "1998" "16:10:04" "EDT" "David R. Williams" "david@cvs.rochester.edu" nil "28" "Re: your measurements" "^From:" nil nil "9" nil nil nil nil]
	nil)
Received: from cvs.rochester.edu (swift.cvs.rochester.edu [128.151.80.1]) by white.Stanford.EDU (8.8.5/8.7.1) with SMTP id NAA13422 for <brian@white.Stanford.EDU>; Mon, 28 Sep 1998 13:10:11 -0700 (PDT)
Received: from [128.151.80.146] (tiger2.cvs.rochester.edu) by cvs.rochester.edu (4.1/MAIN-MX-1.4.3.3)
	id AA07130; Mon, 28 Sep 98 16:10:04 EDT
Message-Id: <v0300781bb23563964579@[128.151.80.146]>
In-Reply-To: <199809281611.JAA12642@red.Stanford.EDU>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
From: "David R. Williams" <david@cvs.rochester.edu>
To: Brian Wandell <brian@white.Stanford.EDU>
Subject: Re: your measurements
Date: Mon, 28 Sep 98 16:10:04 EDT

Brian:

The image on the first pass can be blurred by the optics without affecting
the single pass wavefront estimate from the second pass.  The reason is
that the image formed on the first pass is replicated multiple times on the
CCD  in accordance with the number of lenslets in the wavefront sensor.
Each of these replicas is blurred in the same way by the first pass and
each is also blurred in the same way  by diffraction on the second pass.
All the replicas have the same intensity profile.  The slope of the wave
aberration is computed from the relative positions of the replicas only,
and that does not depend on the first pass.

David


>Hi Dave,
>
>I am about to go off an give my annual optics lecture.  I realized
>that I don't understand one (fundamental) aspect of your work.  The
>image you measure is double pass.  Hence, the source on the retina,
>while compact, still contains the aberrations present from the first
>entry through the lens.  Why doesn't this matter?
>
>Thanks,
>Brian




