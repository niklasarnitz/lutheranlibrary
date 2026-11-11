\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 180.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne a'2 a'4 a'4 \bar "|" fis'2( gis'2) \bar "|" a'1 \bar "|" b'2 b'4 b'4 \bar "|" a'2 a'4 fis'4 \bar "|" e'1 \bar "|" d'1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo e'2 fis'4 fis'4 d'2( e'2) e'1 g'2 g'4 g'4 fis'2 e'4 d'4 d'2( cis'2) a1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t fah -- ren gen Him \skip 1 "mel," si -- tzet zur Rech -- ten des Ba -- "ters," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 d'4 cis'4 b1 cis'1 d'2 d'4 d'4 d'2 a4 a4 a4( g8[ fis8] e2) fis1 }
      \new Voice = "bass" { \voiceTwo cis2 d4 fis4 b,2( e2) a,1 g,2 g,4 g,4 d2 cis4 d4 a,1 d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
