\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 274, printed p. 249.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { bes'1 bes'1 a'1 g'1 a'1 a'\breve \bar "|" g'\breve a'\breve g'\breve a'\breve \bar "|" a'1 a'1 f'1 g'1 a'1 }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Neh -- met hin und es -- "set," das ist mein "Leib†," der für euch ge -- "ge-" }
    \new PianoStaff <<
      \new Staff { \clef treble \global <f' bes'>1 r1 <f' a'>1 r1 <f' a'>1 <f' g' a'>\breve \bar "|" <d' g'>\breve <f' g' a'>\breve <d' g'>\breve <e' a'>\breve \bar "|" r1 r1 <d' f'>1 <bes g'>1 <d' a'>1 }
      \new Staff { \clef bass \global <bes, d'>1 r1 <f c'>1 r1 <f c'>1 <f c'>\breve \bar "|" <g bes>\breve <d d'>\breve <bes, d'>\breve <a, cis'>\breve \bar "|" r1 r1 <d a>1 <ees g>1 <d fis>1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
