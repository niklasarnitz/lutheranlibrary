\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
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
      \new Voice = "soprano" { \voiceOne fis'2( e'2) \bar "|" d'1\fermata \bar "|" a'2( b'2) \bar "|" a'2 fis'4 g'4 \bar "|" a'4( g'4 fis'2) \bar "|" e'1 \bar "|" a'2 a'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo cis'4 d'2 cis'4 d'1 cis'2( d'2) d'2 d'4 d'4 d'1 cis'1 d'2 d'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Him \skip 1 "mel," si \skip 1 zend zu der Rech \skip 1 \skip 1 ten Got -- "tes," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a1 fis1 e2( g2) fis2 a4 b4 a4( b4 a2) a1 a2 a2 }
      \new Voice = "bass" { \voiceTwo a,1 d1\fermata a,2( g,2) d2 d4 b,4 fis,4( g,4 d2) a,1 fis,2 fis,2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
