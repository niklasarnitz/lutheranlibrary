\version "2.24.3"
% Lochner, II. Sanctus minus summum. Source pages 219–220.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''2( a'2) \bar "|" f'1 \bar "|" f'2( a'2 \bar "|" c''2 d''2) \bar "|" c''1 \bar "|" c''2( a'2) \bar "|" f'4 a'4 c''2 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'4( c'2 d'4) d'1 f'1( g'4 a'4 bes'2) a'1 f'4( c'2 d'4) d'4 f'4 g'4( a'4) }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Hei \skip 1 "lig," hei \skip 1 \skip 1 \skip 1 "lig," hei \skip 1 lig bist "du," }
    \new Staff <<
      \clef bass \global \cadenzaOn
      \new Voice { \voiceOne a1 a1 d'1( e'2 f'2) f'1 a1 a4 d'4 e'2 }
      \new Voice = "bass" { \voiceTwo f1 d1 d1( c2 bes,2) f1 f1 d4 d4 c2 }
    >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 ist "Gott," }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
