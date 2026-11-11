\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 181.
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
      \new Voice = "soprano" { \voiceOne d''2 cis''4 cis''4 \bar "|" d''4 d''8 d''8 e''2 \bar "|" d''4 d''4 b'2 \bar "|" a'4 a'4 fis'4( e'4) \bar "|" fis'2 a'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2 e'4 e'4 fis'4 fis'8 fis'8 a'2 fis'4 a'4 g'2 fis'4 e'4 d'4( cis'4) d'2 cis'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Ich glau -- be auch an den Hei -- li -- gen "Geist," der da ist \skip 1 HErr und }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a4 a4 a4 b8 b8 cis'2 a4 d'4 d'2 d'4 a4 a2 a2 a2 }
      \new Voice = "bass" { \voiceTwo d2 a,4 a,4 d4 b,8 b,8 a,2 d4 fis4 g2 d4 cis4 d4( a,4) d2 fis2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
